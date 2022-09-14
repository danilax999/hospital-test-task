class DoctorCategory < ApplicationRecord
  belongs_to :doctor, class_name: 'User'
  belongs_to :category, foreign_key: 'category_name'

  validate :doctor_role_validation

  private

  def doctor_role_validation
    return if doctor&.role == 'doctor'

    errors.add :user, "with id #{patient_id} is not doctor"
  end
end
