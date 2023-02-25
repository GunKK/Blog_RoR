class ArticlesController < ApplicationController

    before_action :require_user, :check_user
    before_action :set_article, only: %i[ show destroy edit update] 

    def index 
        # default 25/page
        @articles = Article.page(params[:page]).per(10)
    end

    def new
        @article = Article.new
    end
    
    def create
        @user = current_user
        @article = Article.new(article_params)
        @article.user_id = @user.id
        if @article.save 
          flash[:notice] = "Tạo bài viết thành công"
          redirect_to article_path(@article)
        else 
          render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Cập nhật thành công"
            redirect_to article_path(@article)
        else
            render "edit" 
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Đã xóa bài viết"
        redirect_to articles_path
    end

    private

        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.required(:article).permit(:title, :description, :category_id)
        end
end