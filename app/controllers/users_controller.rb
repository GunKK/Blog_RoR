class UsersController < ApplicationController 
    
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
    end

    private
        def user_params
          arams.require(:user).permit(:name, :email, :password, :re_password)
        end
end