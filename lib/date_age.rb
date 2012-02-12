require 'date'
require 'date_age/version'

class Date
  # Return age at specified `date`
  def age_at(date)
    return unless respond_to?(:year) && respond_to?(:month) && respond_to?(:day)
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
