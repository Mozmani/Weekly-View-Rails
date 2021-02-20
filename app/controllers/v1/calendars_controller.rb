class V1::CalendarsController < ApplicationController
  # tells controller that @calendars is all calenders, renders as json
  # basic get route
  def index
  
    @calendars = Calendar.all

    render json: @calendars, status: :ok
  end


  


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
      head(:unprocessable_entity)
    end

  end

  # delete route to delete a Calendar
  def destroy
    @calendar = Calendar.where(id: params[:id]).first
    if @calendar.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:wake_hour, :sleep_hour, :user_id, :name)
  end

end
