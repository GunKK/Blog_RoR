class Admin::ArticlesController < ApplicationController
    layout 'layouts/rails_admin/application'

    before_action :set_article, only: %i[ show destroy edit update] 
    
    def index
        @articles = Article.page(params[:page]).per(10)
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Cập nhật thành công"
            redirect_to admin_article_path(@article)
        else
            render "edit" 
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Đã xóa bài viết"
        redirect_to admin_articles_path
    end

    private
        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.required(:article).permit(:title, :description)
        end
end