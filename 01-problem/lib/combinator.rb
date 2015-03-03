require 'csv'
require 'json'
require 'pry'
Dir[File.join(File.expand_path('../../lib', __FILE__), '**/*.rb')].each {|f| require f}

class Combinator
  def initialize(format, journals_csv_path, articles_csv_path, authors_json_path)
    @format = format
    @journals_csv_path = journals_csv_path
    @articles_csv_path = articles_csv_path
    @authors_json_path = authors_json_path
  end

  def print
    puts out
  end

  def out
    journals_record
  end

private
  attr_reader :format, :journals_csv_path, :articles_csv_path, :authors_json_path

  def journals_records
    CsvReader.new(journals_csv_path).to_full_records
  end

  def articles_record

  end

  def authors_record

  end
end
