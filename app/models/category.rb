class Category < ApplicationRecord
  has_many :doctor_categories, foreign_key: 'category_name'
  has_many :doctors, through: :doctor_categories, class_name: 'User'

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  before_save { self.name = name.downcase }

  self.primary_key = :name
end
