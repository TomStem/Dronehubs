class ChangeFormatDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :jobs, :date, :date
  end
end
