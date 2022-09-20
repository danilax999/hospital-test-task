# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Doctor', type: :model do
  subject { build :doctor }

  describe :associations do
    it do
      should have_many(:categories)
        .through(:doctor_categories)
        .with_primary_key(:name)
    end
  end
end
