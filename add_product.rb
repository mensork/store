require 'rexml/document'

file_name = File.dirname(__FILE__) + "/data/products.xml"
puts "File not found" unless File.exist?(file_name)
file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

choice = nil
products = ["book", "movie", "CD"]

def list(products)
  puts "What do we add to the list?"
  products.each_with_index do |item, index|
    puts "#{index + 1}. #{item}"
  end
  puts "x. Leave the store"
end

until choice.to_i > 0 && choice.to_i <= 3
  abort "Good Bye" if choice == 'x'
  list(products)
  choice = STDIN.gets.chomp
end

puts "Enter the following information:"
puts "Author/Director/Performer?"
author = STDIN.gets.chomp
puts "Title?"
title = STDIN.gets.chomp
puts "Year of issue?"
year = STDIN.gets.chomp
puts "Genre?"
genre = STDIN.gets.chomp
puts "Price"
price = STDIN.gets.chomp
puts "Quantity?"
quantity = STDIN.gets.chomp

doc.root.add_element("product",
                     "price" => price,
                     "quantity" => quantity)
    .add_element(products[choice.to_i],
                 "author" => author,
                 "title" => title,
                 "genre" => genre,
                 "year" => year)

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts "Product added successfully"