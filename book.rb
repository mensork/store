class Book < Product

  def update(options)
    @author = options[:author]
    @title = options[:title]
    @genre = options[:genre]
  end

  def info
    "Книга \"#{@title}\", author: #{@author}, genre: #{@genre}"
  end
end