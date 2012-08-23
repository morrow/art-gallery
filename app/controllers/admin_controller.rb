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
    if params["_method"] == "put" and @contact.update_attributes(params[:contact])
      respond_to do |format|
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to("/") }
      end
    end
  end

  def visit
    @visit = Visit.first
    if params["_method"] == "put" and @visit.update_attributes(params[:visit])
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
    if params["_method"] == "put" and @home.update_attributes(params[:home])
      respond_to do |format|
        flash[:notice] = 'Home was successfully updated.'
        format.html { redirect_to("/") }
      end
    end
  end

  def help
  end

end
