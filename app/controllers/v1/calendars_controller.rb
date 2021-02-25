class V1::CalendarsController < ApplicationController
  #before_action :authenticate_request!
  before_action :authorized
  # tells controller that @calendars is all calenders, renders as json
  # basic get route
  def index
  
    @calendars = Calendar.all

    render json: @calendars, status: :ok
  end



  # Get by :id 
  def show
    @calendar = Calendar.where(id: params[:id]).first
    render :show
  end
  
  # post route to create a new calender
  def create
    @calendar = Calendar.new(calendar_params)
    
    if @calendar.save
      render json: @calendar, status: :created
    else
      render json: {message: "could not create calendar", errors: @calendar.errors.full_messages }
    end

  end

  # delete route to delete a Calendar
  def destroy
    @calendar = Calendar.where(id: params[:id]).first
    if @calendar.destroy
      head(:ok)
    else
      render json: {message: "calendar not found", errors: @calendar.errors.full_messages }
    end
  end


  def update
    @calendar = Calendar.where(id: params[:id]).first
    if @calendar.update(calendar_params)
      render json: @calendar
    else
      render json: {message: "calendar could not be updated", errors: @calendar.errors.full_messages }
    end
    

  end



  private

  def calendar_params
    params.require(:calendar).permit(:wake_hour, :sleep_hour, :user_id, :name)
  end

end
