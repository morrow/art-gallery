class ArtistsController < ApplicationController
  
  before_filter :find_artist, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user, :except => [:show, :index]
  before_filter :get_images, :only => [:edit, :new]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @artists }
    end
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @artist }
    end
  end

  # GET /artists/new
  # GET /artists/new.json
  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @artist }
    end
  end

  # GET /artists/1/edit
  def edit
    @categories = Category.all
    @images = Image.all.sort_by(&:name)
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        flash[:notice] = 'Artist was successfully created.'
        format.html { redirect_to(@artist) }
        format.json  { render :json => @artist, :status => :created, :location => @artist }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        flash[:notice] = 'Artist was successfully updated.'
        format.html { redirect_to(@artist) }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @artist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to(artists_url) }
      format.json  { head :ok }
    end
  end

  private
    def find_artist
      @artist = Artist.find(params[:id])
    end

    def get_images
      @images = Image.all.sort_by(&:name)
      json = {}
      @images.each do |image|
        json[image.id] = image.image.to_s
      end
      @images_json = json.to_json
    end

end