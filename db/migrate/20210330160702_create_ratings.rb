class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.string :content

      t.timestamps
    end
  end
end
