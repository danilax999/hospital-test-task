# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'appointments/new', type: :view do
  before(:each) do
    assign(:appointment, build(:appointment))
  end

  it 'renders new appointment form' do
    render

    assert_select 'form[action=?][method=?]', appointments_path, 'post' do
    end
  end
end
