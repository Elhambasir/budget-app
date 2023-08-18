FactoryBot.define do
  factory :group do
    name { 'My Group' }
    icon { 'https://example.com/icon.png' }
    association :author, factory: :user
  end
end
