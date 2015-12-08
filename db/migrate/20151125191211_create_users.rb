class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :student_id
      t.float :hours
      t.string :email
      t.string :password
      t.integer :graduatingyear
      t.boolean :isAdmin
      t.integer :unapproved

      t.timestamps null: false
    end
  end
end
