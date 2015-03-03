module CsvReading
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= csv_file.data
  end

private

  def csv_file
    @csv_file ||= CsvLoader.new(@file_path)
  end
end
