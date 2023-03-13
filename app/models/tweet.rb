class Tweet < ApplicationRecord
  belongs_to :user

  def time_ago_in_words
    time_diff_in_seconds = (Time.zone.parse(DateTime.now.to_s) - created_at)
    hours = (time_diff_in_seconds / 1.hour).round
    return "#{hours}h" if hours.positive?

    minutes = (time_diff_in_seconds / 1.minute).round
    "#{minutes}min"
  end
end
