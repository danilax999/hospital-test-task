class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  validates :doctor, presence: true
  validates :patient, presence: true

  validate :patient_role_validation, :doctor_role_validation

  private

  def patient_role_validation
    return if patient&.role == 'patient'

    # errors.add :patient, "Patient's role must be 'patient', got '#{patient.role}'."
    errors.add :user, "with id #{patient_id} is not patient"
  end

  def doctor_role_validation
    return if doctor&.role == 'doctor'

    # errors.add :doctor, "Doctor's role must be 'doctor', got '#{doctor.role}'."
    errors.add :user, "with id #{patient_id} is not doctor"
  end
end
