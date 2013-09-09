class User < ActiveRecord::Base
  has_many :articles,   dependent: :destroy
  has_many :schoolnews, dependent: :destroy
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :up_articles, through: :relationships, source: :article


	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  validates_uniqueness_of :name
  
    has_secure_password
    validates :password, length: { minimum: 6 }




  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  
  def uped?(article)
    Relationship.find_by(article_id:article.id)
  end

  def up!(article)
    relationships.create!(article_id:article.id)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
  
end
