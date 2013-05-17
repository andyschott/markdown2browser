#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'kramdown'
require 'launchy'

if ARGV.size < 1
  puts "Usage:"
  puts "markdown2browser path_to_markdown_file"
  exit
end

inputPath = ARGV[0]
if !File.exist?(inputPath)
  puts "The file '#{inputPath}' does not exist!"
  exit
end

markdown = IO.read(inputPath)

# Convert the markdown into html
html = Kramdown::Document.new(markdown, :input => 'markdown').to_html

# Save the generated html to a temporary file
destFile = "#{ENV['TMPDIR']}#{inputPath}.html"
IO.write(destFile, html)

# Open the temporary file in the default browser
Launchy.open destFile

