class AddForeignKeysToRatings < ActiveRecord::Migration[6.1]
  def change
    add_reference :ratings, :user, foreign_key: true
    add_reference :ratings, :course, foreign_key: true
  end
end
