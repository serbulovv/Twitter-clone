module Tweets
  class CreateOperation < ApplicationOperation
    def call(params, current_user)
      attrs = Validate(Contract, params)
      user = find_user(current_user)
      if attrs.success? && user.present?
        tweet = create_tweet(current_user, attrs)
        OperationResult.new(true, tweet)
      else
        OperationResult.new(false, nil, attrs)
      end
    end

    private

    def find_user(user)
      User.find_by(id: user.id)
    end

    def create_tweet(current_user, attrs)
      Tweet.create(user_id: current_user.id, text: attrs["text"])
    end
  end
end
