class Category < ActiveRecord::Base
  has_many :job_categories, dependent: :destroy
  has_many :jobs, through: :job_categories

  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
end
