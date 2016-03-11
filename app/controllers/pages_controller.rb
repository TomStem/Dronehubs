class PagesController < ApplicationController

  def home
    @latest_jobs = Job.latest
    @latest_owners = User.latest
  end
end
