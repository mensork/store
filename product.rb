class Product
  def initialize(price, quantity)
    @price = price
    @quantity = quantity
  end

  def self.read_from_xml(file_name
  )
    file_path = File.dirname(__FILE__) + "./data/" + file_name
    abort "File not found" unless File.exist?(file_path)
    file = File.new(file_path, "r:UTF-8")
    doc = REXML::Document.new(file)
    list = []
    product = nil


    doc.elements.each("products/product") do |product_node|
      price = product_node.attributes["price"].to_i
      quantity = product_node.attributes["quantity"].to_i

      product_node.elements.each("book") do |book_node|
        product = Book.new(price, quantity)
        product.update(
            author: book_node.attribute("author"),
            title:  book_node.attribute("title"),
            genre:  book_node.attribute("genre")
        )
      end

      product_node.elements.each("film") do |movie_node|
        product = Movie.new(price, quantity)
        product.update(
            author: movie_node.attribute("author"),
            title:  movie_node.attribute("title"),
            genre:  movie_node.attribute("genre"),
            year:   movie_node.attribute("year"))
      end

      product_node.elements.each("CD") do |disk_node|
        product = Disk.new(price, quantity)
        product.update(
            author: disk_node.attribute("author"),
            title:  disk_node.attribute("title"),
            genre:  disk_node.attribute("genre"),
            year:   disk_node.attribute("year"))
      end
      list << product
    end
    list
  end

  def self.list(list)
    list.each_with_index do |item, index|
      puts "#{index} - #{item.show}"
    end
    puts "x - exit"
  end

  def info
  end

  def show
    "#{info}. Price: #{@price}, [#{@quantity} left]"
  end

  def buy
    if @quantity > 0
      puts "\n\rYou bought: #{info}.\n\r"
      @quantity -= 1
      price
    else
      puts "This Goods are out of stock\n\r"
      0
    end
  end

  def price
    @price
  end
end