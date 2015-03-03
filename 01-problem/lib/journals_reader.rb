require_relative 'csv_reading'

class JournalsReader
  include CsvReading

  def to_full_records
    validate
    parsed.map do |line|
      Publication.new(journal_title: line.first, journal_issn: line.last)
    end
  end

private

  def validate
    unless csv_file.titles.map(&:downcase) == ["title", "issn"]
      raise "Journals file must have titles: Title, ISSN"
    end
  end
end
