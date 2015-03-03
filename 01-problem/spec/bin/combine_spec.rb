require 'spec_helper'
require 'json'

describe 'combine' do
  it "complains about incorect format options" do
    out = `ruby bin/combine.rb --format lol one two three 2>&1`
    expect($?.exitstatus).to eq(1)
    expect(out).to match(/incorrect format/i)
  end

  it "complains if any of the input files are missing" do
    out = `ruby bin/combine.rb --format json one 2>&1`
    expect($?.exitstatus).to eq(1)
    expect(out).to match(/missing input files/i)
  end

  it "outputs a combined file in CSV" do
    skip
    out = `ruby bin/combine.rb --format csv spec/fixtures/mini_articles.csv spec/fixtures/mini_journals.csv spec/fixtures/mini_authors.json`
    expect($?.exitstatus).to eq(0)
    title = "DOI, Article title, Author name, Journal title, Journal ISSN"
    data = "10.1234/altmetric0,Small Wooden Chair,Amari Lubowitz,\"Shanahan, Green and Ziemann\",1337-8688"
    expect(out.split("\n")).to include(title)
    expect(out.split("\n")).to include(data)
  end

  it "outputs a combined file in JSON" do
    skip
    out = `ruby bin/combine.rb --format json spec/fixtures/mini_articles.csv spec/fixtures/mini_journals.csv spec/fixtures/mini_authors.json`
    expect($?.exitstatus).to eq(0)
    hash = JSON.parse(out)
    expect(hash).to eq({
        "doi" => "10.1234/altmetric0",
        "title" => "Small Wooden Chair",
        "author" => "Amari Lubowitz",
        "journal" => "Shanahan, Green and Ziemann",
        "issn" => "1337-8688"
    })
  end
end
