class V1::UsersController < ApplicationController
  # tells controller that @users is all users, renders as json
  # basic get route
  def index
  
    @users = User.all

    render json: @users, status: :ok
  end


  # post route to create a new user
  def create
    @user = User.new(user_params)
    
    @user.save
    render json: @contact, status: :created
  end

  # delete route to delete a user
  def destroy
    @user = User.where(id: params[:id]).first
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
