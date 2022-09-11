FactoryBot.define do
  factory :appointment do
    patient { nil }
    doctor { nil }
    closed { false }
    recommendation { "MyText" }
  end
end
