class AddStudentDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :roll_no, :string
    add_column :users, :date_of_admission, :date
    add_column :users, :department, :string
  end
end
