class TweetsController < ApplicationController
  def create
    operation = Tweets::CreateOperation.new.call(params, current_user)
    flash[:alert] = operation.parse_errors unless operation.success?
    redirect_to dashboard_path
  end
end
