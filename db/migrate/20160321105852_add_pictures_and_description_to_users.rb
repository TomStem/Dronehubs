class AddPicturesAndDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :banner_pic, :string
    add_column :users, :description, :text
  end
end
