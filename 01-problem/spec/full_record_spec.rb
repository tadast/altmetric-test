require 'spec_helper'

describe FullRecord do
  describe "#issn" do
    it "formats it with a dash in the middle" do
      record = FullRecord.new(issn: "12345678")
      expect(record.issn).to eq "1234-5678"
    end
  end
end
