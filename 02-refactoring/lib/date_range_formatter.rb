require "date"
require "fixnum"

class DateRangeFormatter
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @raw_start_date = start_date
    @raw_end_date = end_date
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    if start_date == end_date
      same_date
    elsif start_date.month == end_date.month
      same_month
    elsif start_date.year == end_date.year
      same_year
    else
      no_commonalities
    end
  end

private
  attr_reader :start_time, :end_time

  def start_date
    @start_date ||= Date.parse(@raw_start_date)
  end

  def end_date
    @end_date ||= Date.parse(@raw_end_date)
  end

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end

  def same_date
    if start_time && end_time
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time}"
    elsif end_time
      "#{full_start_date} until #{end_time}"
    else
      full_start_date
    end
  end

  def same_month
    if start_time && end_time
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
    end
  end

  def same_year
    if start_time && end_time
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      start_date.strftime("#{start_date.day.ordinalize} %B - ") + end_date.strftime("#{end_date.day.ordinalize} %B %Y")
    end
  end

  def no_commonalities
    if start_time && end_time
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      "#{full_start_date} - #{full_end_date}"
    end
  end
end

