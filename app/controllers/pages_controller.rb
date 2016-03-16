class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:home, :terms]

  def home
    @latest_jobs = Job.latest
    @latest_owners = User.latest
  end

  def terms
  end
end
