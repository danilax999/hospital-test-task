require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject { build :appointment }

  describe 'validations' do
    it { should_not allow_value(build(:doctor)).for(:patient) }
    it { should_not allow_value(build(:patient)).for(:doctor) }
  end
end
