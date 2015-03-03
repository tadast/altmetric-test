require 'spec_helper'

describe JournalsReader do
  describe "#to_full_records" do
    it "loads the journals data from a csv file to a full record" do
      records = described_class.new("spec/fixtures/mini_journals.csv").to_full_records
      expect(records.size).to eq 1
      expect(records.first.journal).to eq("Shanahan, Green and Ziemann")
      expect(records.first.issn).to eq("1337-8688")
    end
  end
end
