class Job < ActiveRecord::Base
  belongs_to :user

  has_many :bids, dependent: :destroy
  has_many :drones, through: :bids

  has_many :job_categories, dependent: :destroy
  has_many :categories, through: :job_categories

  def self.search(search)
    where("location ILIKE ? ", "%#{search}%")
  end

  scope :latest, -> { order('created_at')[0..2] }
end

