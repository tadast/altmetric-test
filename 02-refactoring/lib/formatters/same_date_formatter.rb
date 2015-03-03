class SameDateFormatter
  include BaseFormatting

  def to_s
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
end
