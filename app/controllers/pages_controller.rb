class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:home, :terms, :legislation, :discover, :about]

  def home
    @latest_jobs = Job.latest
    @latest_owners = User.latest
  end

  def terms
  end

  def legislation
  end

  def discover
    @owners = User.where(owner: true)
  end
end
