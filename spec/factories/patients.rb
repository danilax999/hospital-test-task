# frozen_string_literal: true

FactoryBot.define do
  factory :patient, class: User do
    name { 'John Doe' }
    phone { '444444444' }
    role { 'patient' }
    password { 'password' }
  end
end
