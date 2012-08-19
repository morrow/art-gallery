module ApplicationHelper

  def is_current_page page
    page = page.to_s
    a = controller.controller_name
    b = page
    if a == 'static'
      current_page?(:controller => 'static', :action => b)
    elsif a == 'admin'
      current_page?(:controller => 'admin', :action => b)
    elsif a.match b and a.length == b.length
      true
    end
  end

  def is_admin
    request.host == "admin.restonartgallery.dev"
  end

  def cms_get(key)
    key = key.to_s
    begin
      if key.match /^visit\//
        Visit.first[key.split('visit/')[1]]
      elsif key.match /^contact\//
        Contact.first[key.split('contact/')[1]]
      elsif Cms.find(key)
        Cms.find(key)[:value]
      end
    rescue
      false
    end
  end

  def max_length(text, length)
    text = text[0..length]
    text += "..." if text.length >= 50
    text
  end

  def process_text text
    text.gsub(/\n/, '<br />')
  end

  def date_field
    "test"
  end

  def apostrophe
    return "<span class='apostrophe'>&#8217;</span>".html_safe
  end

  def default_image_tag object=nil, args=nil
    if object.nil?
      object = Image.find('default')
    end
    if args
      image_tag(object.image, args)
    else
      image_tag object.image
    end
  end

  def action_divider
    content_tag(:span, " / ", :class => "action_divider")
  end

end
