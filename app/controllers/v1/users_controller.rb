module V1
  class UsersController < ApplicationController
    before_action :authorized, only: [:index, :show]
    def index
  
      @users = Users.all
  
      render json: @Users, status: :ok
    end
    
    def create
      @user = User.new(user_params)

      if @user.save
        render :create
      else
        render json: {message: "could not create user", errors: @user.errors.full_messages }
      end
    end

    def show
      @user = User.where(id: params[:id]).first
      render :show
    end

  
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end

    
  
  end
end