# frozen_string_literal: true

FactoryBot.define do
  factory :patient, class: User do
    name { 'John Doe' }
    phone { 44_444_444 }
    role { 'patient' }
    password { 'password' }
  end
end
