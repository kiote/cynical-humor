module ApplicationHelper
  def title
    title = 'Циничные шутки каждый день'
    title = @title if !@title.nil?
    title += ' | '
    title
  end
end
