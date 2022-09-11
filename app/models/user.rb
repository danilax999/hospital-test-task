class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, presence: true,
                    uniqueness: true,
                    format: { with: /\d{7,16}/ }

  before_validation :format_phone

  def format_phone
    self.phone = phone.chars.filter { |c| '0' <= c && c <= '9' }.join
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
