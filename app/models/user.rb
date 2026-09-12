class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :courses, foreign_key: :teacher_id, dependent: :destroy
 has_one_attached :avatar

 has_many :enrollments, foreign_key: :student_id, dependent: :destroy
has_many :enrolled_courses, through: :enrollments, source: :course


  # Validation for students only
  validates :roll_no, :date_of_admission, :department, presence: true, if: -> { student? }


  ROLES = %w[student teacher recruiter]

  validates :role, presence: true, inclusion: { in: ROLES }

  def student?
    role == 'student'
  end

  def teacher?
    role == 'teacher'
  end

  def recruiter?
    role == 'recruiter'
  end
end
