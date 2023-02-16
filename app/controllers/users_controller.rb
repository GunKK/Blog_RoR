class UsersController < ApplicationController 

  # before_action :set_user, only: %i[show edit update] 
  
  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "Đăng kí thành công? Hi #{@user.name}"
      redirect_to articles_path
    else
      render 'new' 
    end
  end

  def show
    @articles = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Cập nhật tài khoản thành công"
      redirect_to articles_path
    else 
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    # def set_user
    #   @user = User.find(params[:id])
    # end
end