class Movie < Product
  def update(options)
    @author = options[:author]
    @title = options[:title]
    @genre = options[:genre]
    @year = options[:year]
  end

  def info
    "Фильм \"#{@title}\"(#{@year}), director: #{@author}, genre: #{@genre}"
  end
end