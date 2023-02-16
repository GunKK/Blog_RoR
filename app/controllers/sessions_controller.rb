class SessionsController < ApplicationController
    
    def new
    end 

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            session[:name] = user.name
            flash[:notice] = "Hi, #{user.name}"
            redirect_to articles_path
        else
            flash.now[:notice] = "Đăng nhập thất bại ! " 
            render 'new'
        end 
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Đăng xuất thành công"
        redirect_to login_path
    end
    
end