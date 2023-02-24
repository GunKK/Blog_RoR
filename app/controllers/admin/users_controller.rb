class Admin::UsersController < ApplicationController
    layout 'layouts/rails_admin/application'
    
    before_action :require_user, :check_admin
    before_action :set_user, only: %i[ show destroy edit update] 
    
    def index
        @users = User.page(params[:page]).per(10)
    end

    def show
        @article_user = @user.articles
    end

    def edit
        @article_user = @user.articles
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Cập nhật thành công"
            redirect_to admin_users_path
        else
            render "edit" 
        end
    end

    def destroy
        @article_user = @user.articles
        if @article_user.count > 0 
            # nếu người dùng có bài viết thì không xóa được
            flash[:notice] = "Lỗi không xóa được"
            redirect_to admin_users_path
        else 
            # nếu người dùng không có bài viết nào thì không xóa được
            @user.destroy
            flash[:notice] = "Đã xóa người dùng"
            redirect_to admin_users_path
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.required(:user).permit(:name, :email, :password ,:is_admin)
        end
end