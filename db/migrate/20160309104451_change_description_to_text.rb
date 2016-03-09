class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :bids, :description, :text
    change_column :jobs, :description, :text
  end
end
