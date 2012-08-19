class ImagesController < ApplicationController
  
  before_filter :find_image, :only => [:show, :edit, :update, :destroy]
  before_filter :find_categories, :only => [:edit, :new]
  before_filter :authenticate_user, :except => [:show, :index]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    @categories = Category.all.sort_by(&:name)
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new
    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @image }
    end
  end

  # GET /images/1/edit
  def edit
    @images = Image.all
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])
    respond_to do |format|
      if @image.save
        flash[:notice] = 'Image was successfully created.'
        format.html { redirect_to(@image) }
        format.json  { render :json => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(@image) }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(images_url) }
      format.json  { head :ok }
    end
  end

  private
    def find_image
      @image = Image.find(params[:id])
    end

    def find_categories
      @categories = Category.all
    end

end
