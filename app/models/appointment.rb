# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  validates :doctor, presence: true
  validates :patient, presence: true

  validate :patient_role_validation,
           :doctor_role_validation,
           :doctor_max_appointments_validation
  validate :appointment_exists_validation, on: :create

  private

  def patient_role_validation
    user_role_validation :patient, patient
  end

  def doctor_role_validation
    user_role_validation :doctor, doctor
  end

  def user_role_validation(field_name, user = nil, role: nil)
    user ||= send field_name
    role ||= field_name.to_s

    return if user.nil? || user.role == role

    errors.add field_name, "must have role '#{role}', got '#{user.role}'"
  end

  def doctor_max_appointments_validation
    max_appointments = Rails.configuration.x.doctor.max_appointments
    return if doctor.appointments.count <= max_appointments

    errors.add :doctor, "can have only #{max_appointments} at time"
  end

  def appointment_exists_validation
    return unless Appointment.exists? patient:, doctor:, closed: false

    errors.add :appointment, 'already exists'
  end
end
