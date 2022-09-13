FactoryBot.define do
  factory :patient, class: User do
    name { 'John Doe' }
    phone { 44444444 }
    role { 'patient' }
    password { 'password' }
  end
end
