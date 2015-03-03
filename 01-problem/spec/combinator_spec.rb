require 'spec_helper'

describe Combinator do
  describe "#out" do
    it "combines the mini files" do
      combinator = described_class.new('json', 'spec/fixtures/mini_journals.csv', 'spec/fixtures/mini_articles.csv', 'spec/fixtures/mini_authors.json')
      expect(JSON.parse(combinator.out).first).to eq({
        "doi" => "10.1234/altmetric0",
        "article_title" => "Small Wooden Chair",
        "author_name" => "Amari Lubowitz",
        "journal_title" => "Shanahan, Green and Ziemann",
        "journal_issn" => "1337-8688"
      })
    end
  end
end
