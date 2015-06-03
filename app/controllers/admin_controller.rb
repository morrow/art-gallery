class AdminController < ApplicationController

  before_filter :authenticate_user
  before_filter :get_images, :only => [:visit]
  before_filter :get_categories, :only => [:visit]

  # GET /admin
  # GET /admin.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @admin }
    end
  end

  def artists
    @artists = Artist.all
  end

  def exhibits
    @exhibits = Exhibit.all
  end

  def events
    @events = Event.all
  end

  def contact
    @contact = Contact.first
    if params["_method"] == "patch" and @contact.update_attributes(contact_params)
      respond_to do |format|
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to("/") }
      end
    end
  end

  def visit
    @visit = Visit.first
    if params["_method"] == "patch" and @visit.update_attributes(visit_params)
      respond_to do |format|
        flash[:notice] = 'Visit was successfully updated.'
        format.html { redirect_to("/") }
      end
    end
  end

  def home
    @images = Image.all
    @categories = Category.all
    json = {}
    @images.each do |image|
      json[image.id] = image.image.to_s
    end
    @images_json = json.to_json
    @home = Home.first
    if params["_method"] == "patch" and @home.update_attributes(home_params)
      respond_to do |format|
        flash[:notice] = 'Home was successfully updated.'
        format.html { redirect_to("/") }
      end
    end
  end

  def help
  end

  private
  def visit_params
    params.require(:visit).permit(:days, :hours, :address, :image_id, :description, :directions_link, :directions_text)
  end
  def home_params
    params.require(:home).permit(:title, :subtitle, :text, :image_id)
  end
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :facebook, :twitter, :instagram, :flickr)
  end

end
