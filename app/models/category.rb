class Category < ActiveRecord::Base
  has_many :job_categories
  has_many :jobs, through: :job_categories

  has_many :user_categories
  has_many :users, through: :user_categories

end
