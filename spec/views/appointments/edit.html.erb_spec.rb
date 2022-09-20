# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'appointments/edit', type: :view do
  let(:appointment) { build :appointment }

  before(:each) do
    assign(:appointment, appointment)
  end

  it 'renders the edit appointment form' do
    render

    assert_select 'form[action=?][method=?]', appointment_path(appointment),
                  'post' do
    end
  end
end
