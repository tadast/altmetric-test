require 'csv'
class CsvLoader
  def initialize(file_path)
    @file_path = file_path
  end

  def data
    titles
    parsed
  end

  def titles
    @titles ||= parsed.shift
  end

private
  def parsed
    @parsed ||= CSV.parse(File.read(File.join(File.dirname(__FILE__), '..', @file_path)))
  end
end
