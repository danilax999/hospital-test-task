class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors = User.where role: 'doctor'
  end
end
