module AdminHelper

  def new_button name
    link_to "/#{name.to_s.pluralize}/new", :class => "new button" do
      content_tag(:span, "+ ", {:class => "pictos"}) + content_tag(:span, "Add a new #{name}")
    end
  end

end
