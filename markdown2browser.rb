#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'kramdown'

if ARGV.size < 1
  puts "usage here!"
  exit
end

inputPath = ARGV[0]
if !File.exist?(inputPath)
  puts "The file '#{inputPath}' does not exist!"
  exit
end

markdown = IO.read(inputPath)
puts Kramdown::Document.new(markdown, :input => 'markdown').to_html
