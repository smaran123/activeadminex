class TasksController < ApplicationController
 before_action :set_task,:except => [:complete,:index,:new,:create]

 def index
  @tasks = Task.incomplete
end

def complete
  @tasks = Task.completed
end

def completed
@task = Task.find(params[:id])
@task.update(:completed => true)
  redirect_to tasks_path
end

def new
  @task = Task.new
end

def create
  @task = Task.new(task_params)
  if @task.save
    redirect_to tasks_path
  else
    render :new
  end
end

def show
end

def edit
end

def update
  if @task.update(task_params)
    redirect_to tasks_path
  else
    render :edit
  end
end

def destroy
  @task.destroy
  tasks_path
end

private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit!
end

end
