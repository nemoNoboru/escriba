#!/usr/bin/env ruby
# {!} info Command line interface made by Felipe Vieira for Escriba
# {!} info It reads an filename from arguments , parse the lines and print them.
require './parser.rb'
require './printer.rb'
# {!} function functions displayHelp, a simple function to display an usage mesage
def displayHelp
  puts "Usage: escriba.rb <name-of-document-to-parse>"
  puts "Escriba, Language agnostic simple html documentation generator based in specially crafted comments in code"
  puts "Made by Felipe Vieira"
end

if ARGV.length == 0
  puts "too few arguments"
  displayHelp
end

if ARGV.length > 1
  puts "too much arguments"
  displayHelp
end
puts "Escriba, Version 1.0. Reading file #{ARGV[0]}"
puts "Initializing..."
parser = Parser.new(ARGV[0])

nameFile = ARGV[0].split(".")[0] + ".html"

counter = 0

puts "Parsing..."
begin
  input = File.open(ARGV[0],"r")
  while (buffer = input.gets)
    if parser.parse buffer
      counter = counter + 1
    end
  end
  input.close
rescue IOError => err
  puts "an error has ocurred"
  puts err
end

puts "#{counter} comments founded."
puts "processing..."
printer = Printer.new(nameFile,parser.documento)
printer.printDoc
printer.printToFile
puts "Processed"
