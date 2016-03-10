class AddPhotoToDrone < ActiveRecord::Migration
  def change
    add_column :drones, :photo, :string
  end
end
