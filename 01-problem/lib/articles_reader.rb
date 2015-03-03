class ArticlesReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= csv_file.data
  end

  def to_full_records
    validate
    parsed.map do |line|
      FullRecord.new(doi: line[0], title: line[1], issn: line[2])
    end
  end

private

  def csv_file
    @csv_file ||= CsvLoader.new(@file_path)
  end

  def validate
    unless csv_file.titles.map(&:downcase) == ["doi", "title", "issn"]
      raise "Articles file must have titles: DOI, Title, ISSN"
    end
  end
end
