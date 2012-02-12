require 'date'
require 'date_age/version'

class Date
  # Return age at specified `date`
  def age_at(date)
    unless date.respond_to?(:year) && date.respond_to?(:month) && date.respond_to?(:day)
      raise ArgumentError, "age_at(date): date should respond to :year, :month and :day"
    end
    birthday = self
    today    = date
    age = today.year - birthday.year
    if today.month < birthday.month
      age -= 1
    elsif birthday.month == today.month
      age -= 1 if today.day < birthday.day
    end
    age
  end

  # Return age of today
  def age
    age_at(Date.today)
  end
end
