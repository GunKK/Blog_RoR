class ApplicationController < ActionController::Base

    # chống lỗi bảo mật CSRF
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user 
        if !logged_in?
            flash[:notice] = "Bạn phải đăng nhập để thực hiện hành động này"
            redirect_to login_path
        end
    end

    def check_admin 
        unless current_user.is_admin
            redirect_to login_path
        end
    end

    def check_user 
        if !current_user.is_admin
            redirect_to login_path
        end
    end
end
