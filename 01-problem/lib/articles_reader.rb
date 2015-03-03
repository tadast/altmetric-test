class ArticlesReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= CsvLoader.new(@file_path).load
  end

  def to_full_records
    parsed.map do |line|
      FullRecord.new(doi: line[0], title: line[1], issn: line[2])
    end
  end
end
