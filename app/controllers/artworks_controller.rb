class ArtworksController < ApplicationController

  before_filter :find_artwork, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user, :except => [:show, :index]


  # GET /artworks
  # GET /artworks.json
  def index
    @artworks = Artwork.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @artworks }
    end
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @artwork }
    end
  end

  # GET /artworks/new
  # GET /artworks/new.json
  def new
    @artwork = Artwork.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @artwork }
    end
  end

  # GET /artworks/1/edit
  def edit
  end

  # POST /artworks
  # POST /artworks.json
  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        flash[:notice] = 'Artwork was successfully created.'
        format.html { redirect_to(@artwork) }
        format.json  { render :json => @artwork, :status => :created, :location => @artwork }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /artworks/1
  # PUT /artworks/1.json
  def update
    respond_to do |format|
      if @artwork.update_attributes(artwork_params)
        flash[:notice] = 'Artwork was successfully updated.'
        format.html { redirect_to(@artwork) }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy

    respond_to do |format|
      format.html { redirect_to(artworks_url) }
      format.json  { head :ok }
    end
  end

  private
    def find_artwork
      @artwork = Artwork.find(params[:id])
    end
    def artwork_params
      params.require(:artwork).permit(:name)
    end

end
