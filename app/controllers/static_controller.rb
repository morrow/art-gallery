class StaticController < ApplicationController

  def email
  end

  def contact
    @contact = Contact.first
  end

  def visit
    @visit = Visit.first
  end

end
