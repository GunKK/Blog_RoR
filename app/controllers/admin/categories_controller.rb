class Admin::CategoriesController < ApplicationController
    layout 'layouts/rails_admin/application'

    before_action :require_user, :check_admin
    before_action :set_category, only: %i[ destroy edit update] 
    
    def index
        @categories = Category.page(params[:page]).per(10)
    end

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save 
          flash[:notice] = "Tạo danh mục thành công"
          redirect_to admin_categories_path
        else 
          render 'new'
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:notice] = "Cập nhật thành công"
            redirect_to admin_categories_path
        else
            render "edit" 
        end
    end

    def destroy
        @category.destroy
        flash[:notice] = "Đã xóa bài viết"
        redirect_to admin_categories_path
    end

    private
        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.required(:category).permit(:name)
        end
end