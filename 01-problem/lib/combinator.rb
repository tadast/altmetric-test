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
    if format == 'json'
      full_records.map(&:to_h).to_json
    elsif format == 'csv'
      lines = [CSV.generate_line(Publication::TITLES)]
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

  def full_records
    @full_records ||= begin
      articles_and_journals = combine_journals_with_articles(journals_records, articles_records)
      combine_authors_with_articles_and_journals(authors_records, articles_and_journals)
    end
  end

  def combine_journals_with_articles(journals, articles)
    articles.map do |article|
      journal_publication = journals.find{ |journal| journal.journal_issn == article.journal_issn }
      article.journal_title = journal_publication && journal_publication.journal_title
      article
    end
  end

  def combine_authors_with_articles_and_journals(authors, articles_and_journals)
    authors.map do |author|
      publication = articles_and_journals.find{ |aj| aj.doi == author.doi }
      if publication
        publication.author_name = author.author_name
        publication
      else
        author
      end
    end
  end
end
