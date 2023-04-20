module Tweets
  class Contract < ApplicationContract
    params do
      required(:text).filled(:string, max_size?: 280)
    end
  end
end
