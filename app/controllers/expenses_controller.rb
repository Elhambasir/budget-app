class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.order(created_at: :desc)
    # three most recent expenses for current_user for given group
    @most_recent_expenses = current_user.expenses
      .joins(:groups).where(groups: { id: params[:group_id] }).order(created_at: :desc).limit(3)
    # three most ancient expenses for current_user for given group
    @most_ancient_expenses = current_user.expenses
      .joins(:groups).where(groups: { id: params[:group_id] }).order(created_at: :asc).limit(3)
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.build
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @group = Group.find(expense_params[:group_id])
    @expense = @group.expenses.build(expense_params.except(:group_id))
    @expense.author = current_user
    respond_to do |format|
      if @expense.save
        @expense.groups.push(Group.find(expense_params[:group_id]))
        format.html do
          redirect_to group_expenses_path(group_id: expense_params[:group_id]),
                      notice: 'Expense was successfully created.'
        end
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params.except(:group_id))
        format.html { redirect_to group_expenses_path, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to group_expenses_path, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find_by(id: params[:id])
    return if @expense

    flash[:alert] = "Couldn't find expense."
    redirect_to group_expenses_path
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id, :group_id)
  end
end
