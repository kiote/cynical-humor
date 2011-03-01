module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  # do not resize animated gif
  def my_image_tag image
    return image_tag image.url :big unless image.content_type == 'image/gif'
    image_tag image.url
  end

  def smart_post_body post, params
    str = post.body
    
    if !post.body.index('<!-- cut -->').nil?
      if params[:cut]
        str = truncate(post.body, :separator => '<!-- cut -->',  \
          :omission => link_to('Продолжение...', post_path(post)))
      end
      str.sub!('<!-- cut -->','')
    end

    if !str.index('<!-- raw -->').nil?
      return raw str
    else
      return simple_format str
    end
  end
end
