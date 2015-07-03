class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :organization_id
      t.string :name

      t.timestamps null: false
    end
  end
end