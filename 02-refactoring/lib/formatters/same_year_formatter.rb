class SameYearFormatter
  include BaseFormatting

  def to_s
    if start_time && end_time
      full_range
    elsif start_time
      start_datetime_to_end_date
    elsif end_time
      start_date_to_end_datetime
    else
      start_date.strftime("#{start_date.day.ordinalize} %B - ") + end_date.strftime("#{end_date.day.ordinalize} %B %Y")
    end
  end
end
