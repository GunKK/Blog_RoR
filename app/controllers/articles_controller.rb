class ArticlesController < ApplicationController

    before_action :set_article, only: %i[ show destroy edit update] 

    def index 
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save 
          flash[:notice] = "Tạo bài viết thành công"
          redirect_to articles_path(@article)
        else 
          render 'new'
        end
    end

    def show
        # @article = Article.find(params[:id])
    end

    def edit
        # @article = Article.find(params[:id])
    end

    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Cập nhật thành công"
            redirect_to article_path(@article)
        else
            render "edit" 
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Đã xóa bài viết"
        redirect_to articles_path
    end

    private

        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.required(:article).permit(:title, :description)
        end
end