require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { build :category }

  describe :fields do
    it do
      should have_db_column(:name)
        .of_type(:string)
        .with_options(null: false)
    end
    it { should have_db_index :name }
  end

  describe :associations do
    it { should have_many(:doctors).through(:doctor_categories) }
  end

  describe :validations do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
