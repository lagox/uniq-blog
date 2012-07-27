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
end
