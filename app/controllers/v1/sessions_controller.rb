class V1:: SessionsController < ApplicationController 
    before_action :authorized, only: [:destroy]
    # def show
    #     current_user ? head(:ok) : head(:unauthorized)
        
    # end
    
    def create
        @user = User.where(email: params[:email]).first

       
        if @user.valid_password?(params[:password])
            jwt = JsonWebToken.encode(user_id: @user.id)
        

            render :create, locals:{token: jwt }, status: :created
        else
            render json: {error: "invalid login request"},  status: :unauthorized
        end
    end

    def destroy
        current_user&.authentication_token = nil
        if current_user.save
            head(:ok)
        else
            head(:unauthorized)
        end
    end

end
