if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "product.rb"
require_relative "disk.rb"
require_relative "book.rb"
require_relative "movie.rb"
require 'rexml/document'


products = Product.read_from_xml("products.xml")
total_amount = 0
choice = nil

until choice == "x" do
  Product.list(products)
  choice = STDIN.gets.chomp
  if choice.to_i >= 0 && choice.to_i < products.size
    purchase = products[choice.to_i]
    purchase.buy
    total_amount += purchase.price
  else
    "Product not found"
  end
end

puts "\n\rThanks for purchases. Total price: #{total_amount}"


