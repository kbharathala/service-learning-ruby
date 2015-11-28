class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :place
      t.string :description
      t.float :hours
      t.date :date

      t.references :user

      t.timestamps null: false
    end
  end
end
