class V1::CalendarsController < ApplicationController
  # tells controller that @calendars is all users, renders as json
  # basic get route
  def index
  
    @calendars = Calendar.all

    render json: @calendars, status: :ok
  end


  # post route to create a new user
  def create
    @calendar = Calendar.new(user_params)
    
    @calendar.save
    render json: @calendar, status: :created
  end

  # delete route to delete a user
  def destroy
    @calendar = Calendar.where(id: params[:id]).first
    if @calendar.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:calendar).permit(:wake_hour, :sleep_hour, :user_id)
  end

end
