class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         # :recoverable,
         :rememberable,
         :validatable

  has_many :doctor_categories, foreign_key: 'doctor_id'
  has_many :categories, through: :doctor_categories

  enum role: {
         admin: 0,
         patient: 1,
         doctor: 2
       },
       _default: :patient

  # has_many :appointments, ->(user) { where user.role => user.id }

  validates :name, presence: true,
                   length: { minimum: 3 }

  validates :phone, presence: true,
                    uniqueness: true,
                    format: { with: /\d{7,16}/ }

  validates :role, presence: true

  before_validation :format_phone

  def format_phone
    self.phone = phone.chars.filter { |c| '0' <= c && c <= '9' }.join
  end

  def appointments
    Appointment.where(role => id)
  end

  ##
  # Creates an +Appointment+ with +doctor+.
  # +doctor+ must be +User+ or user_id with role 'doctor'.
  # Returns created appointment.
  #
  def take_an_appointment(doctor)
    doctor = User.find doctor if doctor.is_a? Integer
    Appointment.create patient: self, doctor:
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
