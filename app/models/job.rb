class Job < ActiveRecord::Base
  belongs_to :user
  
  has_many :bids, dependent: :destroy 
  has_many :drones, through: :bids
end
