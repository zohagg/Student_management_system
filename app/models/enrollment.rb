class Enrollment < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :course

  validates :status, inclusion: { in: ["pending", "approved", "rejected"] }

  scope :approved, -> { where(status: "approved") }
  scope :pending, -> { where(status: "pending") }
end
