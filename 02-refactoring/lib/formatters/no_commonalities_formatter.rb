class NoCommonalitiesFormatter
  include BaseFormatting

  def to_s
    if start_time && end_time
      full_range
    elsif start_time
      start_datetime_to_end_date
    elsif end_time
      start_date_to_end_datetime
    else
      "#{full_start_date} - #{full_end_date}"
    end
  end
end
