include ActionView::Helpers::TagHelper 

module FormHelper

  class FormBuilder < ActionView::Helpers::FormBuilder

    def date_field input
      id = "#{self.object_name}_#{input}"
      name = "#{self.object_name}[#{input}]"
      puts "chrome specific date format"
      value = nil
      value = self.object[input].strftime("%Y-%m-%d") if self.object[input]
      content_tag(:input, nil, {:name => name, :id => id, :type => :date, :value => value})
    end

    def cancel name="Cancel"
      id = "#{self.object_name}_cancel"
      confirmation = "Cancel this form and lose all changes?"
      content_tag(:div, name, {:class => "cancel button", :onmousedown => "confirm('#{confirmation}') && window.history.go(-1);"})
    end

  end

end