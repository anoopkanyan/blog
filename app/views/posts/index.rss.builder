xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "ChewTab Blog"
    xml.description "This is a blog by ChewTab"
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.content.truncate(157)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)

       # If Image exists, add the elements
        if  post.image.exists?
            xml.image do
              xml.url  post.image.url(:original)
              xml.title  post.title
              xml.link  post.image.url(:original)
            end
        end
        
      end
    end
  end
end