require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :patient }

  describe :fields do
    it do
      should have_db_column(:name)
        .of_type(:string)
        .with_options(null: false)
    end
    it do
      should have_db_column(:phone)
        .of_type(:string)
        .with_options(null: false)
    end
    it do
      should have_db_column(:role)
        .of_type(:integer)
        .with_options(null: false)
    end
    it do
      should define_enum_for(:role)
        .with_values(admin: 0, patient: 1, doctor: 2)
    end
  end

  describe :associations do
    # it { should have_many :appointments }
  end

  describe :validations do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(3) }

    it { should validate_presence_of :phone }
    it { should validate_uniqueness_of(:phone).case_insensitive }
    it { should validate_presence_of :role }
    # TODO: phone validation
  end
end
