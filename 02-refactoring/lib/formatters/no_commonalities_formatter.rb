class NoCommonalitiesFormatter
  include BaseFormatting
  include AnyTimePresentFormatting

  def to_s
    formatted_with_time || "#{full_start_date} - #{full_end_date}"
  end
end
