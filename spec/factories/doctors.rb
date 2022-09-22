# frozen_string_literal: true

FactoryBot.define do
  factory :doctor, class: User do
    name { 'John Doe' }
    phone { '555555555555' }
    role { 'doctor' }
    password { 'password' }
  end
end
