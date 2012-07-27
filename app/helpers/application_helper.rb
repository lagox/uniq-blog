# -*- encoding : utf-8 -*-
module ApplicationHelper
  def title(page_title)
    basetitle = "Online blog"
    if page_title.empty?
      basetitle
    else
      "#{basetitle} / #{page_title}"
    end
  end
  
  def error_messages_for(object)
    render(:partial => "shared/error_messages", :locals => {:object => object})
  end
  
  def icon_time
    raw("<i class='icon-time'></i>")
  end
end
