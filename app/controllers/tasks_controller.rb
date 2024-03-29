class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category


    def index
        @tasks = @category.tasks
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        if @task.save
            redirect_to category_tasks_path(@category)
        else
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to category_tasks_path(@category)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to category_tasks_path(@category)
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :category_id, :deadline)
    end
end
