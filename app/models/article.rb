class Article < ApplicationRecord

	belongs_to :feed
	validates :title, presence: true
	validates :link, presence: true
	validates :link, uniqueness: true

	def self.create_article(article_attr)
		article = Article.create(article_attr)
	end
		
end 
 