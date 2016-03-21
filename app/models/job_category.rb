class JobCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :job
end
