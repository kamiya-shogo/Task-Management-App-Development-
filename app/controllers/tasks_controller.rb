class TasksController < ApplicationController
  before_action :set_user
  
  
  def index
    @tasks = @user.tasks
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを新規作成しました'
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = @user.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = 'タスクを更新しました'
      redirect_to user_task_url (@user)
    else
      render :edit
    end
  end
  
  private
    
    def task_params
      params.require(:task).permit(:name, :description)
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end
  
end
