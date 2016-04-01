class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bids, through: :drones # as owner
  has_many :drones, dependent: :destroy # as owner
  has_many :jobs, dependent: :destroy # as inquirer

  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories

  scope :owners, -> { where(owner: true) }
  scope :latest, -> { order('created_at').limit(3) }

  mount_uploader :profile_pic, PhotoUploader
  mount_uploader :banner_pic, PhotoUploader
end
