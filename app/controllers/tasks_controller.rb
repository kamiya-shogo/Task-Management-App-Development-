class TasksController < ApplicationController
  before_action :set_user
  
  
  def index
    @tasks = User.all
  end
  
  def show
  end
  
  private
    
    def set_user
      @user = User.find(params[:user_id])
    end
  
end
