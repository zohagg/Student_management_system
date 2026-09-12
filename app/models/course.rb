class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :assignments, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :enrollments, dependent: :destroy
has_many :students, through: :enrollments, source: :student


  validates :name, presence: true
end
