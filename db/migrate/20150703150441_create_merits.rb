class CreateMerits < ActiveRecord::Migration
  def change
    create_table :merits do |t|
      t.text :message
      t.integer :meritor_id
      t.integer :meritee_id

      t.timestamps null: false
    end
  end
end
