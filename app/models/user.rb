class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bids, dependent: :destroy, through: :drones # as owner
  has_many :drones, dependent: :destroy # as owner
  has_many :jobs, dependent: :destroy # as requester
end
  