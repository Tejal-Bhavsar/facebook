module Api::V1
    class UsersController < ApplicationController
        # before_action :authenticate_user
        def index
            @users = User.all
            render json: @users
        end

        def create
            @user = User.new(user_params)

            if @user.save
                render json: @user
            else 
                render error: { error: 'Unable to create User.'},status: 400
            end
        end

        private

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
    end
     
end