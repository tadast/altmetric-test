require_relative 'csv_reading'

class ArticlesReader
  include CsvReading

  def to_full_records
    validate
    parsed.map do |line|
      Publication.new(doi: line[0], article_title: line[1], journal_issn: line[2])
    end
  end

private

  def validate
    unless csv_file.titles.map(&:downcase) == ["doi", "title", "issn"]
      raise "Articles file must have titles: DOI, Title, ISSN"
    end
  end
end
