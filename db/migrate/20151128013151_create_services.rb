class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :place
      t.float :hours

      t.references :user

      t.timestamps null: false
    end
  end
end
