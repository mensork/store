class Disk < Product
  def update(options)
    @author = options[:author]
    @title = options[:title]
    @genre = options[:genre]
    @year = options[:year]
  end

  def info
    "CD \"#{@title}\"(#{@year}), Performance by: #{@author}, genre: #{@genre}"
  end
end