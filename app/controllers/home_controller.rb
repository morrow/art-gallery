class HomeController < ApplicationController
  
  def index
    @home = Home.first
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @home }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @home }
    end
  end

  def new
    @home = Home.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @home }
    end
  end

  def edit
    @images = Image.all
    @categories = Category.all
  end

  def create
    @home = Home.new(params[:home])
    respond_to do |format|
      if @home.save
        flash[:notice] = 'Home was successfully created.'
        format.html { redirect_to(@home) }
        format.json  { render :json => @home, :status => :created, :location => @home }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @home.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @home.update_attributes(params[:home])
        flash[:notice] = 'Home was successfully updated.'
        format.html { redirect_to("/admin") }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @home.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to(home_url) }
      format.json  { head :ok }
    end
  end

end