# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'appointments/index', type: :view do
  before(:each) do
    assign(:appointments, build_list(:appointment, 10))
  end

  it 'renders a list of appointments' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
