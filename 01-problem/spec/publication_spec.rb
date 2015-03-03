require 'spec_helper'

describe Publication do
  describe "#journal_issn" do
    it "formats it with a dash in the middle" do
      record = Publication.new(journal_issn: "12345678")
      expect(record.journal_issn).to eq "1234-5678"
    end
  end
end
