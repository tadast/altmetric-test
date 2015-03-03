#!/usr/bin/env ruby

require "bundler/setup"
require_relative "../lib/combinator"
require "pry"

options = {}
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: ruby combine.rb --format <format> journals.csv articles.csv authors.json > full_articles.<format>"
  opts.on('-f', '--format format', String, 'output format') { |o| options[:format] = o.to_s.downcase }
end.parse!

unless ['json', 'csv'].include?(options[:format])
  raise ArgumentError.new("Incorrect format: #{options[:format]} is not supported. Supported formats are json and csv")
end

file_paths = optparse.select{ |input| input.to_s.size > 0 }
if file_paths.size != 3
  raise ArgumentError.new("Missing input files. Please run the command with -h flag for usage")
end

Combinator.new(options[:format], *file_paths).print
