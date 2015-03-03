module AnyTimePresentFormatting

private

  def formatted_with_time
    if start_time && end_time
      full_range
    elsif start_time
      start_datetime_to_end_date
    elsif end_time
      start_date_to_end_datetime
    end
  end

  def full_range
    "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
  end

  def start_datetime_to_end_date
    "#{full_start_date} at #{start_time} - #{full_end_date}"
  end

  def start_date_to_end_datetime
    "#{full_start_date} - #{full_end_date} at #{end_time}"
  end

end
