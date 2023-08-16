FactoryBot.define do
  factory :expense do
    name { "test" }
    amount { 22 }
    association :author, factory: :user
  end
end
