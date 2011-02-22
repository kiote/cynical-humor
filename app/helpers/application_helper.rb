module ApplicationHelper
  def title
    title = 'Циничные шутки каждый день'
    title = @title if !@title.nil?
    title += ' | '
    title
  end

  def vk_main
    code = '<div id="vk_like"></div>
        <script type="text/javascript">
        VK.Widgets.Like("vk_like", {type: "full"});
        </script>'

    return code if current_page? root_url
    ''
  end
end
