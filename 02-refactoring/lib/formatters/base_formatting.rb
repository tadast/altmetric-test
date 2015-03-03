module BaseFormatting
  attr_reader :start_date, :end_date, :start_time, :end_time

  def initialize(start_date, end_date, start_time, end_time)
    @start_date = start_date
    @end_date = end_date
    @start_time = start_time
    @end_time = end_time
  end

protected

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end
