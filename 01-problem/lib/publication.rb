class Publication
  TITLES = ["DOI", "Article title", "Author name", "Journal title", "Journal ISSN"]
  attr_accessor :doi, :article_title, :author_name, :journal_title
  attr_writer :journal_issn

  def initialize(doi: nil, article_title: nil, author_name: nil, journal_title: nil, journal_issn: nil)
    @doi = doi
    @article_title = article_title
    @author_name = author_name
    @journal_title = journal_title
    @journal_issn = journal_issn
  end

  def to_h
    {
      doi: doi,
      article_title: article_title,
      author_name: author_name,
      journal_title: journal_title,
      journal_issn: journal_issn,
    }
  end

  def to_a
    [doi, article_title, author_name, journal_title, journal_issn]
  end

  def journal_issn
    return nil if @journal_issn.nil?
    @formatted_issn ||= begin
      numbers = @journal_issn.scan(/\d/).join('')
      unless numbers.size == 8
        raise "ISSN #{@journal_issn} is invalid. Must be 8 digits, optionally separated with a '-'"
      end
      [numbers[0..3], numbers[4..-1]].join("-")
    end
  end
end
