FactoryBot.define do
  factory :group_expense do
    association :group
    association :expense
  end
end
