module V1
  class TasksController < ApplicationController
    def create
      @task = Task.new(task_params)

      if @task.save
        render :create
      else
        head(:unprocessable_entity)
      end
    end
  
    def task_params
    
      params.require(:task).permit(:calendar_id, :name, :desc, :start, :end, :day)
    
    end

  
  end
end