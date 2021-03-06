# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  # include ActsAsTaggableOn::TagsHelper

  def title(page_title)
    basetitle = "Блог Ерлана Кусаинова"
    if page_title.empty?
      basetitle
    else
      "#{basetitle} / #{page_title}"
    end
  end
  
  def keywords
    "Ruby on Rails разработка, Agile, BDD, Веб-разработка, юзабилити, интерфейсы, стартап, бизнес, Git, верстка, ООП, linux, mac os x"
  end
  
  def description
    base_desc = "Блог о веб-технологиях, продуктах."
    if @description
      "base_desc #{@description}"
    else
      base_desc
    end
  end
  
  def error_messages_for(object)
    render(:partial => "shared/error_messages", :locals => {:object => object})
  end
  
  def icon_time
    raw("<i class='icon-time'></i>")
  end
  
  def tags_icon
    raw("<i class='icon-tag'></i>")
  end
  
  def comment_icon
    raw("<i class='icon-comment'></i>")
  end
  
  def find_all_subcategories(category)
    if category.children.size > 0
      ret = "<ul>"
      category.children.each { |subcat|
        if subcat.children.size > 0
          ret += "<li class='closed'>"
          ret += "<span class='folder sub'>"
          ret += link_to subcat.title, subcat
          ret += "</span>"
          ret += find_all_subcategories(subcat)
          ret += "</li>"
        else
          ret += "<li>"
          ret += "<span class='notsubcat sub'>"
          ret += link_to subcat.title, subcat
          ret += '</span>'
          ret += "</li>"
        end
      }
      ret += "</ul>" 
    end
  end  
  
  def isset_subcat?(object)
    if object.children.size > 0
      true
    end
  end

  def more_post(text)
    truncate(text, :length => 900, :separator => " ", :omission => "...")
  end

end
