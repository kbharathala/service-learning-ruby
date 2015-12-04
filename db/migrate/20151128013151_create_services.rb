class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :placeName
      t.string :placeAddress
      t.string :placePhone
      
      t.string :description
      t.string :impact

      t.float :hours
      t.date :date

      t.boolean :approved
      t.references :user

      t.timestamps null: false
    end
  end
end
