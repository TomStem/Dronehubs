class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:home, :terms, :legislation]

  def home
    @latest_jobs = Job.latest
    @latest_owners = User.latest
  end

  def terms
  end

  def legislation
  end
end
