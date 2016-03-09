class Bid < ActiveRecord::Base
  belongs_to :job
  belongs_to :drone
  belongs_to :user, as: :owner # as owner
end
