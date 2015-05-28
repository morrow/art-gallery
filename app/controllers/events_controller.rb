class EventsController < ApplicationController

  # get song from database for applicable methods event
  before_filter :find_event, :only => [:show, :edit, :update, :destroy]
  # authenticate using devise (optional)
  #before_filter :authenticate_user!, :only => :show

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.json  { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update_attributes(event_params)
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.json  { head :ok }
    end
  end

  private
    def find_event
      @event = Event.find(params[:id])
    end
    def event_params
      params.require(:event).permit(:name)
    end

end
