class GetFeedJob < ApplicationJob
  queue_as :default

  def perform(feed)
  	feed.read_artiles
  end
end
