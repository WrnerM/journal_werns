class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def show
        @category = Category.find(params[:id])
        @tasks = @category.tasks
    end

    def update
        @category = Category.find(params[:id])
        if @category.update category_params
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end
