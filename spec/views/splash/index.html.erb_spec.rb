require 'rails_helper'
RSpec.describe 'splash/index.html.erb', type: :view do
  it 'Must have a link to the login page' do
    render
    expect(rendered).to have_link('LOG IN')
  end

  it 'Must have a link to the registration page' do
    render
    expect(rendered).to have_link('SIGN UP')
  end
end
