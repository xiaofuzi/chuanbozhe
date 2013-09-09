class StaticPagesController < ApplicationController
  include Math
  def home
   
  	@articles = all_articles
  	@articles.each do |art|
      t = Time.new
      p = art.up_users.count+1
      tt = (t.to_i-art.created_at.to_i)/3600
      #art.score = art.score + (art.up_users+1)/((((t.to_i-art.created_at.to_i)/3600)+12).sqrt(1.5))
      
      s = (tt + 12)

      art.score = art.score + p/s
    end
    @articles.sort { |x,y| y <=> x }
  end

  def help
  end

  def about
   
  end

  def contact
  end
  def chuanbozhe
    if signed_in?
      redirect_to home_path
    end
  end
end
