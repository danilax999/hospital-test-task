FactoryBot.define do
  factory :doctor, class: User do
    name { 'John Doe' }
    phone { 44444444 }
    role { 'doctor' }
    password { 'password' }
  end
end
