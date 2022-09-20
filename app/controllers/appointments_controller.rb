# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  # GET /appointments or /appointments.json
  def index
    @appointments = current_user.appointments.order(updated_at: :desc)
    @appointments.each { |a| authorize! :index, a }

    render :index
  end

  # GET /appointments/1 or /appointments/1.json
  # def show; end

  # GET /appointments/new
  # def new
  #   @appointment = Appointment.new
  # end

  # GET /appointments/1/edit
  # def edit; end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new appointment_params.merge patient: current_user

    authorize! :create, @appointment

    if @appointment.save
      flash[:notice] = 'Appointment was successfully created.'
      redirect_to action: :index
    else
      flash[:notice] = 'Appointment create error.'
      render_error :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    @appointment = find_appointment

    authorize! :update, @appointment

    if @appointment.update appointment_params.merge closed: true
      flash[:notice] = 'Appointment was successfully updated.'
      redirect_to action: :index
    else
      # redirect_to action: :edit, status: :unprocessable_entity
      flash[:notice] = 'Appointment update error.'
      render_error :unprocessable_entity
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment = find_appointment

    authorize! :destroy, @appointment

    if @appointment.destroy
      flash[:notice] = 'Appointment was successfully deleted .'
      redirect_to action: :index
    else
      notice[:alert] = 'Appointment delete error.'
      render_error :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :closed, :recommendation)
  end

  def access_denied
    render_error :forbidden
  end

  def find_appointment
    Appointment.find params[:id]
  end
end
