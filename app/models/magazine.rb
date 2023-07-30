require_relative "./article"
class Magazine
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all = self
  end
  
  def contributors
    Article.all.select do |mag|
    mag.magazine == self
    end.map do |magazine|
      magazine.author
    end
  end
  
  def self.fnd_by_name(name)
    @@all.find do |na|
      na.name == name
    end
  end

    def article_titles
      Article.all.filter do |article|
        article.magazine == self
      end.select {|a| ["#{a.title}"]}
    end
  
    def contributing_authors
    Article.all.select do |mag|
    mag.magazine == self
    end.map do |magazine|
     magazine.author > 2
    end.uniq.map do |article|
      article.articles.count > 2
    end
    end

end

