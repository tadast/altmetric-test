class FullRecord
  attr_accessor :doi, :title, :author, :journal
  attr_writer :issn

  def initialize(doi: nil, title: nil, author: nil, journal: nil, issn: nil)
    @doi = doi
    @title = title
    @author = author
    @journal = journal
    @issn = issn
  end

  def issn
    @formatted_issn ||= begin
      numbers = @issn.scan(/\d/).join('')
      unless numbers.size == 8
        raise "ISSN #{@issn} is invalid. Must be 8 digits, optionally separated with a '-'"
      end
      [numbers[0..3], numbers[4..-1]].join("-")
    end
  end
end
