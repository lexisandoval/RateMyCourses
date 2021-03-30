class AddForeignKeysToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :subject, foreign_key: true
  end
end
