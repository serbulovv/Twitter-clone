class TweetsController < ApplicationController
  def create
    tweet = Tweet.create(user_id: current_user.id, text: params["text"])
    flash[:alert] = tweet.valid? ? nil : "Invalid params"
    redirect_to root_path
  end
end
