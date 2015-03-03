class JournalsReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= csv_file.data
  end

  def to_full_records
    validate
    parsed.map do |line|
      FullRecord.new(journal: line.first, issn: line.last)
    end
  end

private

  def csv_file
    @csv_file ||= CsvLoader.new(@file_path)
  end

  def validate
    unless csv_file.titles.map(&:downcase) == ["title", "issn"]
      raise "Journals file must have titles: Title, ISSN"
    end
  end
end
