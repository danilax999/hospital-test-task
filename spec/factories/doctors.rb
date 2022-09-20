# frozen_string_literal: true

FactoryBot.define do
  factory :doctor, class: User do
    name { 'John Doe' }
    phone { 44_444_444 }
    role { 'doctor' }
    password { 'password' }
  end
end
