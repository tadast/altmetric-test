class JournalsReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= CsvLoader.new(@file_path).load
  end

  def to_full_records
    parsed.map do |line|
      FullRecord.new(journal: line.first, issn: line.last)
    end
  end
end
