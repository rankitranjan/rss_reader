class Feed < ApplicationRecord
	include Feed::ReadRss
	has_many :articles, dependent: :destroy
	validates :name, presence: true
	validates :url, uniqueness: true
	validates :url, presence: true

	after_create :add_articles
	after_update :add_articles

	def add_articles
		GetFeedJob.perform_now self
	end
	
end
