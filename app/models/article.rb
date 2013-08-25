class Article < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :title,   presence: true, length:{ maximum: 30 }

	default_scope -> { order('created_at DESC') }
end
