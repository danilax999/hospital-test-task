# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  validates :doctor, presence: true
  validates :patient, presence: true

  validate :patient_role_validation, :doctor_role_validation

  private

  def patient_role_validation
    user_role_validation :patient, patient
  end

  def doctor_role_validation
    user_role_validation :doctor, doctor
  end

  def user_role_validation(field_name, user = nil, role: nil)
    user ||= send field_name
    role ||= field_name

    return if user.nil? || user.role == role

    errors.add field_name, "must have role '#{role}', got '#{user.role}'"
  end
end
