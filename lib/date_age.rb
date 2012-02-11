require 'date'
require 'date_age/version'

class Date
  def age_at(date)
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

  def age
    age_at(Date.today)
  end
end
