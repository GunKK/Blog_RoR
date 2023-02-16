class UsersController < ApplicationController 

  before_action :set_user, only: [:edit, :update, :show]

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "Đăng kí thành công? Hi #{@user.name}, Vui lòng đăng nhập lại!"
      redirect_to login_path
    else
      render 'new' 
    end
  end

  def show
    @user_articles = @user.articles.all
  end

  def edit
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash[:notice] = "Cập nhật tài khoản thành công"
      redirect_to users_path
    else 
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def set_user
      @user = User.find(session[:user_id])
    end
end