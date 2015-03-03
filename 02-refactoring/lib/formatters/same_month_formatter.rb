class SameMonthFormatter
  include BaseFormatting
  include AnyTimePresentFormatting

  def to_s
    formatted_with_time || start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
  end
end
