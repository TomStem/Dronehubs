class Job < ActiveRecord::Base
  belongs_to :user
  
  has_many :bids, dependent: :destroy 
  has_many :drones, through: :bids


  scope :latest, -> { order('created_at')[0..2] }

end

