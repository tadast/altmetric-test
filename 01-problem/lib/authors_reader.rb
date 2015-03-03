require 'json'
class AuthorsReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= begin
      journals_file = File.read(File.join(File.dirname(__FILE__), '..', @file_path))
      JSON.parse(journals_file)
    end
  end

  def to_full_records
    parsed.flat_map do |hash|
      hash["articles"].map do |doi|
        FullRecord.new(author: hash["name"], doi: doi)
      end
    end
  end
end
