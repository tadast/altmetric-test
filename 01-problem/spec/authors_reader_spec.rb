require 'spec_helper'

describe AuthorsReader do
  describe "#to_full_records" do
    it "loads the data from a json file to a full record" do
      records = AuthorsReader.new("spec/fixtures/mini_authors.json").to_full_records
      expect(records.size).to eq 1
      expect(records.first.author_name).to eq("Amari Lubowitz")
      expect(records.first.doi).to eq("10.1234/altmetric0")
    end
  end
end
