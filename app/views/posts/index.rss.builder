xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Черный юмор на nifiga.com"
    xml.description "Циничные шутки каждый день"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        if post.image.file?
          xml.media(:content, post.image.url)
        end
        xml.description post.body
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end