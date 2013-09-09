class Article < ActiveRecord::Base
	
	belongs_to :user
	validates :user_id, presence: true
	validates :title,   presence: true, length:{ maximum: 100 }
    validates_uniqueness_of :title
    has_many :relationships, foreign_key: "article_id", dependent: :destroy
    has_many :up_users, through: :relationships, source: :user

	default_scope -> { order('created_at DESC') }
	after_initialize :init 



    def self.fetch_title
    	scraper = Scraper.define do 
    		process "title", :title=>:text
    		result :title 
        end
        if :content==nil
               uri = URI.parse(:website)
               update_attribute :content,scrape(uri)
           
        end
    end

    

	private
	   def init
	   	self.score = 50
	   end
end
