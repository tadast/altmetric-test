class CsvReader
  def initialize(file_path)
    @file_path = file_path
  end

  def parsed
    @parsed ||= begin
      journals_file = File.read(File.join(File.dirname(__FILE__), '..', @file_path))
      CSV.parse(journals_file)
    end
  end

  def to_full_records
    titles
    parsed.map do |line|
      record = FullRecord.new
      line.each_with_index do |value, index|
        record.public_send("#{titles[index]}=", value)
      end
      record
    end
  end

private

  def titles
    @titles ||= parsed.shift.map{ |title| title.to_s.downcase }
  end
end
