require_relative "./article" 
class Author
  attr_accessor :name :articles, :magazines

  def initialize(name)
    @name = name
  
  end
  
  def articles
    Article.all.select |article|
    article.author == self
    end
  end

  def magazines
    articles.each do |article|
     ["#{article.magazine}"].uniq
     
    end
  end

  def add_article(magazine, title)
    Article.new(magazine, title)
  end
  
  def topic_areas
    magazines.map do |magazine|
      ["#{magazine.category}"].uniq
    end
  end
end