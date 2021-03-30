class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :number
      t.string :description

      t.timestamps
    end
  end
end
