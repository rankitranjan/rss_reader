require 'open-uri'

module ReadRss

  def read_artiles 
    xml = Nokogiri::XML(open(self.url))
    xml.xpath('//item').each do |article|
	  	article_ = {}
		  article_[:title] = ActionView::Base.full_sanitizer.sanitize(article.at("title").text.strip)
		  article_[:link] = article.at("link").text
		  article_[:published_at] = article.at("pubDate").present? ? article.at("pubDate").text : DateTime.now.to_s
		  article_[:description] = ActionView::Base.full_sanitizer.sanitize(article.at("description").text.strip) if article.at("description").present?
		  article_[:feed_id] = self.id
		  Article.create_article(article_)
  	end
  end

end
 