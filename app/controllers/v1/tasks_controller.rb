module V1
  class TasksController < ApplicationController
    
    def index
      @task = Task.all
      render json: @task.order("day", "start"), status: :ok
    end
    
    def create
      @task = Task.new(task_params)

      if @task.save
        render :create
      else
        @task.errors.full_messages
        
        render json: {message: "There was an issue updating this task", errors: @task.errors.full_messages}
      end
    end


    def update
      @task = Task.where(id: params[:id]).first
      if @task.update(task_params)
        render json: @task
      else
        body(@task.errors.full_messages)
        render json: {message: "There was an issue updating this task", errors: @task.errors.full_messages}
      end
    end

    private
  
    def task_params
    
      params.require(:task).permit(:calendar_id, :name, :desc, :start, :end, :day, :text_color, :background_color)
    
    end

  
  end
end