module PostsHelper
  include ActsAsTaggableOn::TagsHelper

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
