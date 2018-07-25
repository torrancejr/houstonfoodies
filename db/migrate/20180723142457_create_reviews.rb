class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body
      t.integer :user_id, null: false
      t.integer :truck_id, null: false

      t.timestamps
    end
  end
end