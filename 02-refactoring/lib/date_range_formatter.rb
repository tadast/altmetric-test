require "date"
require "fixnum"
Dir[File.join(File.dirname(__FILE__), "formatters/**/*.rb")].each {|f| require f}

class DateRangeFormatter
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @raw_start_date = start_date
    @raw_end_date = end_date
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    formatter_klass.new(start_date, end_date, start_time, end_time).to_s
  end

private
  attr_reader :start_time, :end_time

  def formatter_klass
    if start_date == end_date
      SameDateFormatter
    elsif (start_date.year == end_date.year) && (start_date.month == end_date.month)
      SameMonthFormatter
    elsif start_date.year == end_date.year
      SameYearFormatter
    else
      NoCommonalitiesFormatter
    end
  end

  def start_date
    @start_date ||= Date.parse(@raw_start_date)
  end

  def end_date
    @end_date ||= Date.parse(@raw_end_date)
  end
end

