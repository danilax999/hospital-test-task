FactoryBot.define do
  factory :appointment do
    patient { build :patient }
    doctor { build :doctor }
    closed { false }
    recommendation { "MyText" }
  end
end
