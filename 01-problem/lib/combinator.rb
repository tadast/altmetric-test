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
    articles_and_journals = combine_journals_with_articles(journals_records, articles_records)
    full_records = combine_authors_with_articles_and_journals(authors_records, articles_and_journals)
    if format == 'json'
      full_records.map(&:to_h).to_json
    elsif format == 'csv'
      lines = [CSV.generate_line(["DOI", "Article title", "Author name", "Journal title", "Journal ISSN"])]
      full_records.each do |record|
        lines << CSV.generate_line(record.to_a)
      end
      lines.join
    end
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

  def combine_journals_with_articles(journals, articles)
    articles.map do |article|
      journal = journals.find{ |journal| journal.issn == article.issn }
      article.journal = journal && journal.journal
      article
    end
  end

  def combine_authors_with_articles_and_journals(authors, articles_and_journals)
    authors.map do |author|
      aj = articles_and_journals.find{ |aj| aj.doi == author.doi }
      if aj
        aj.author = author.author
        aj
      else
        author
      end
    end
  end
end
