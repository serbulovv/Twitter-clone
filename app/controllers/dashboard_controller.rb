class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweets::GetAllTweetsOperation.new.call
    @pagy, @tweets = pagy(@tweets, items: 5)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
