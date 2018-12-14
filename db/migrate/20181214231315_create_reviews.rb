class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :points

      t.timestamps
    end
    add_index :reviews, [:user_id, :room_id], :unique => true
  end
end
