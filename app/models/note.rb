class Note < ApplicationRecord
  belongs_to :course
  validates :title, presence: true
  has_many_attached :attachments
end
