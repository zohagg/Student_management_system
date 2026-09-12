class Assignment < ApplicationRecord
  belongs_to :course
  validates :title, presence: true
  has_many_attached :files

end
