require 'csv'
class CsvLoader
  def initialize(file_path)
    @file_path = file_path
  end

  def load
    contents = File.read(File.join(File.dirname(__FILE__), '..', @file_path))
    parsed = CSV.parse(contents)
    parsed.shift # remove titles
    parsed
  end
end
