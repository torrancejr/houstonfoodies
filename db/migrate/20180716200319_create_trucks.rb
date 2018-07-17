class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
       t.string :name, null:false
      t.string :location
      t.string :website
      t.string :photo
      t.string :rating
    end
  end
end
