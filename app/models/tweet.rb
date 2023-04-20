class Tweet < ApplicationRecord
  belongs_to :user

  def time_ago_in_words
    time_diff_in_seconds = (Time.zone.now - created_at).to_i
    if time_diff_in_seconds < 60
      return "#{time_diff_in_seconds}s"
    elsif time_diff_in_seconds < 3600 
      return "#{(time_diff_in_seconds / 60).to_i}min"
    elsif time_diff_in_seconds < 86400 
      return "#{(time_diff_in_seconds / 3600).to_i}h"
    else
      return created_at.strftime("%b %d")
    end
  end
end
