class CreateDrones < ActiveRecord::Migration
  def change
    create_table :drones do |t|
      t.string :brand
      t.string :model
      t.string :camera
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
