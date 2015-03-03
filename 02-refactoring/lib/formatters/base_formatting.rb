module BaseFormatting
  attr_reader :start_date, :end_date, :start_time, :end_time

  def initialize(start_date, end_date, start_time, end_time)
    @start_date = start_date
    @end_date = end_date
    @start_time = start_time
    @end_time = end_time
  end

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
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
