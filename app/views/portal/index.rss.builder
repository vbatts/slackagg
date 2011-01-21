
xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do

   xml.title       "Slackware Agg Feed"
   xml.link        url_for :only_path => false, :controller => 'articles'
   xml.description "Slackware Feeds Aggregated"

   @aggregate.each do |article|
     xml.item do
       xml.title       "%s: %s" % [ article[:feed_title], article[:feed_item][:title] ]
			 xml.pubDate     article[:feed_item][:published].rfc2822
			 xml.author			 article[:feed_item][:author]
       xml.link        article[:feed_item][:link]
       xml.description "%s: %s (%s)" % [article[:feed_title], article[:feed_item][:link], article[:feed_item][:published].rfc2822]
       xml.guid        "%s#%s#slackagg" % [article[:feed_item][:link], article[:feed_item][:published].to_i],
				 "isPermaLink" => "true"
     end
   end

 end
end

