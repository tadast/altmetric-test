class ArticlesReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= begin
      journals_file = File.read(File.join(File.dirname(__FILE__), '..', @file_path))
      parsed = CSV.parse(journals_file)
      parsed.shift # remove titles
      parsed
    end
  end

  def to_full_records
    parsed.map do |line|
      FullRecord.new(doi: line[0], title: line[1], issn: line[2])
    end
  end
end
