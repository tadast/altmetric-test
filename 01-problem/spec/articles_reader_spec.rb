require 'spec_helper'

describe ArticlesReader do
  describe "#to_full_records" do
    it "loads the articles data from a csv file to a full record" do
      records = described_class.new("spec/fixtures/mini_articles.csv").to_full_records
      expect(records.size).to eq 1
      expect(records.first.title).to eq("Small Wooden Chair")
      expect(records.first.issn).to eq("1337-8688")
      expect(records.first.doi).to eq("10.1234/altmetric0")
    end
  end
end
