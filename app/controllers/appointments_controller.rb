class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  # GET /appointments or /appointments.json
  def index
    @appointments = current_user.appointments
  end

  # GET /appointments/1 or /appointments/1.json
  # def show; end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  # def edit; end

  # POST /appointments or /appointments.json
  def create
    doctor_id = appointment_create_params[:doctor_id].to_i
    @appointment = current_user.take_an_appointment doctor_id

    respond_to do |format|
      if @appointment.persisted?
        # format.html { redirect_to appointment_url(@appointment), notice: 'Appointment was successfully created.' }
        format.html { redirect_to appointments_url, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  # def update
  #   respond_to do |format|
  #     if @appointment.update(appointment_params)
  #       # format.html { redirect_to appointment_url(@appointment), notice: 'Appointment was successfully updated.' }
  #       format.html { redirect_to appointments_url, notice: 'Appointment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @appointment }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @appointment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment = Appointment.find appointment_destroy_params[:id].to_i
    @appointment.destroy

    respond_to do |format|
      if @appointment.destroyed?
        format.html { redirect_to appointments_url, notice: 'Appointment was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to appointments_url, notice: 'Appointment delete error.' }
        format.json { head :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def appointment_create_params
    params.require(:appointment).permit(:doctor_id)
  end

  def appointment_destroy_params
    params.permit(:id)
  end
end
