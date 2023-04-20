module Tweets
  class GetAllTweetsOperation < ApplicationOperation
    def call
      tweets = all_tweets
      sort_tweets(tweets)
    end

    private

    def all_tweets
      Tweet.all
    end

    def sort_tweets(tweets)
      tweets.order(created_at: :desc)
    end
  end
end
