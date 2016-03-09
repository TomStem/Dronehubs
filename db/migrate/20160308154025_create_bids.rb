class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.string :description
      t.string :status, default: 'open'
      t.references :job, index: true, foreign_key: true
      t.references :drone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
