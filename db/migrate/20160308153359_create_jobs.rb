class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :location
      t.datetime :date
      t.string :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
