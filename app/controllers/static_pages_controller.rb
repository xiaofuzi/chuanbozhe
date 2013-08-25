class StaticPagesController < ApplicationController
  def home
  	@articles = all_articles
  end

  def help
  end

  def about
  end

  def contact
  end
end
