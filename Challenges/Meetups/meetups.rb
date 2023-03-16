require 'date'

class Meetup
  attr_reader :year, :month
  
  OCCURENCE_CHANGER = {
    "first" => 0,
    "second" => 1,
    "third" => 2,
    "fourth" => 3,
    "fifth" => 4,
    "last" => -1,
    "teenth" => "teenth"
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(dayofweek, occurence)
    dayofweek.downcase!
    occurence.downcase!
    
    full_month_hash = assign_occurences(@year, @month)
    occurence_val = OCCURENCE_CHANGER[occurence]
    date = nil
    
    if occurence == "teenth"
      teenth_dates = full_month_hash[occurence_val]
      dayofweek_dates = full_month_hash[dayofweek]
      date = dayofweek_dates.select { |d| teenth_dates.include?(d) }[0]
    else
      date = full_month_hash[dayofweek][occurence_val]
    end
    
    date
  end
  
  private
  
  def assign_occurences(year, month)
    day = 1
    
    teenth = [13, 14, 15, 16, 17, 18, 19]
    
    day_hash = {
      0 => "sunday",
      1 => "monday",
      2 => "tuesday",
      3 => "wednesday",
      4 => "thursday",
      5 => "friday",
      6 => "saturday"
    }
    
    hash = {
      "sunday" => [],
      "monday" => [],
      "tuesday" => [],
      "wednesday" => [],
      "thursday" => [],
      "friday" => [],
      "saturday" => [],
      "teenth" => []
    }
    
    loop do
      date = Date.civil(year, month, day)
      dayofweek = day_hash[date.wday]
      hash[dayofweek] << date
      hash["teenth"] << date if teenth.include?(day)
      
      day += 1
      break if !Date.valid_date?(year, month, day)
    end
    
    hash
  end
end