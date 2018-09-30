require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '3h' do
	Rails.logger.info "geting articles worker"
	feeds = Feed.all
	if feeds.present?
		feeds.each do |feed|
			feed.add_articles
		end
	end
	Rails.logger.info "geting articles worker"
end
