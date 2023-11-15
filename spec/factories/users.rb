FactoryBot.define do
  factory :user do
    name { 'Dora' }
    email { 'dora@gmail.com' }
    password { 'passcode' }
    password_confirmation { 'passcode' }
  end
end
