module FacebookDistanceOfTimeInWords # :nodoc: all
  module FacebookDistanceOfTimeInWordsHelpers
    def facebook_distance_of_time_in_words(past_date)
      today = Date.today
      days_difference = (today-past_date.to_date).to_i
      if days_difference == 0
        #: if the date is today, we display time
        time_difference = (Time.now-past_date)
        if time_difference > 1.hour
          t(:days_ago, :scope => :facebook_distance_of_time_in_words, :day_string => distance_of_time_in_words_to_now(past_date, false))
        else
          t(:today_at_time, :scope => :facebook_distance_of_time_in_words, :hour => l(past_date, :format => :fdotin_hour_minute))
        end
      elsif days_difference == 1
        #: If the date is yesterday
        t(:yesterday_at_time, :scope => :facebook_distance_of_time_in_words, :hour => l(past_date, :format => :fdotin_hour_minute))
      elsif days_difference < 7
        #: If the date is in the week, we display the day's name
        t(:day_with_hour, :scope => :facebook_distance_of_time_in_words, :day => l(past_date, :format => :fdotin_day_name), :hour => l(past_date, :format => :fdotin_hour_minute))
      else
        #: Else, distance
        t(:days_ago, :scope => :facebook_distance_of_time_in_words, :day_string => distance_of_time_in_words_to_now(past_date, false))
      end
    end
  end
end