class UsersController < ApplicationController 

  before_action :require_user, :check_user, except: %i[new create]
  before_action :set_user, only: %i[ show friend destroy] 
  before_action :set_current_user, only: %i[ edit update] 

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

  def index
    # Lấy tất cả người dùng là user role =0
    @users = User.where(:is_admin => "0")
  end

  def show
    @friend_count = @user.friend.count
    @user_articles = @user.articles
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Cập nhật thành công"
      redirect_to user_path(@article)
    else
      render "edit" 
    end
  end

  def friend
    @friends = @user.friend
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
      params.required(:user).permit(:name, :email, :password)
    end

    def set_current_user
      @user = User.find(session[:user_id])
    end
end