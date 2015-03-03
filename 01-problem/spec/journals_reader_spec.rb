require 'spec_helper'

describe JournalsReader do
  describe "#to_full_records" do
    it "raises an error if the data file is wrong" do
      expect{
        described_class.new("spec/fixtures/mini_articles.csv").to_full_records
      }.to raise_error("Journals file must have titles: Title, ISSN")
    end

    it "loads the journals data from a csv file to a full record" do
      records = described_class.new("spec/fixtures/mini_journals.csv").to_full_records
      expect(records.size).to eq 1
      expect(records.first.journal_title).to eq("Shanahan, Green and Ziemann")
      expect(records.first.journal_issn).to eq("1337-8688")
    end
  end
end
