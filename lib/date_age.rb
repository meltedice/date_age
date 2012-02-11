require "date_age/version"

class Date
  def age_at(date)
    date.year - self.year
  end
end
