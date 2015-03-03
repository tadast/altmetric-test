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
    journals_records + articles_records + authors_records
  end

private
  attr_reader :format, :journals_csv_path, :articles_csv_path, :authors_json_path

  def journals_records
    @journals_records ||= JournalsReader.new(journals_csv_path).to_full_records
  end

  def articles_records
    @articles_records ||= ArticlesReader.new(articles_csv_path).to_full_records
  end

  def authors_records
    @authors_records ||= AuthorsReader.new(authors_json_path).to_full_records
  end
end
