class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweets::GetAllTweetsOperation.new.call
  end
end
