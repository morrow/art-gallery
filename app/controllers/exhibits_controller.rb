class ExhibitsController < ApplicationController
  
  # get song from database for applicable methods exhibit
  before_filter :find_exhibit, :only => [:show, :edit, :update, :destroy]
  # authenticate using devise (optional)
  #before_filter :authenticate_user!, :only => :show

  # GET /exhibits
  # GET /exhibits.json
  def index
    @exhibits = Exhibit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @exhibits }
    end
  end

  # GET /exhibits/1
  # GET /exhibits/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @exhibit }
    end
  end

  # GET /exhibits/new
  # GET /exhibits/new.json
  def new
    @exhibit = Exhibit.new
    @artists = Artist.all.sort_by(&:last_name)
    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @exhibit }
    end
  end

  # GET /exhibits/1/edit
  def edit
    @images = Image.all.sort_by(&:name)
    @categories = Category.all
    json = {}
    @images.each do |image|
      json[image.id] = image.image.to_s
    end
    @images_json = json.to_json
    @artists = Artist.all.sort_by(&:last_name)
  end

  # POST /exhibits
  # POST /exhibits.json
  def create
    @exhibit = Exhibit.new(params[:exhibit])
    respond_to do |format|
      if @exhibit.save
        flash[:notice] = 'Exhibit was successfully created.'
        format.html { redirect_to(@exhibit) }
        format.json  { render :json => @exhibit, :status => :created, :location => @exhibit }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @exhibit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exhibits/1
  # PUT /exhibits/1.json
  def update
    artists = params[:exhibit][:artists]
    puts "artists #{artists}"
    params[:exhibit][:artists] = []
    artists.each do |artist_id|
      params[:exhibit][:artists].push Artist.find artist_id if artist_id != ""
    end
    puts params[:exhibit][:artists]
    respond_to do |format|
      if @exhibit.update_attributes(params[:exhibit])
        flash[:notice] = 'Exhibit was successfully updated.'
        format.html { redirect_to(@exhibit) }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @exhibit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibits/1
  # DELETE /exhibits/1.json
  def destroy
    @exhibit.destroy

    respond_to do |format|
      format.html { redirect_to(exhibits_url) }
      format.json  { head :ok }
    end
  end

  private
    def find_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

end