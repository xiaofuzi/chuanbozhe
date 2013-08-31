class StaticPagesController < ApplicationController
  def home
  	@articles = all_articles
  	@article  = Article.find_by_id(1)
  end

  def help
  end

  def about
   
  end

  def contact
  end
end
