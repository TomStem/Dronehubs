class Drone < ActiveRecord::Base
  belongs_to :user

  has_many :bids, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
