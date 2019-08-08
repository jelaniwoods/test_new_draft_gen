class TasksController < ApplicationController
  def index
    @tasks = Task.all
    
    respond_to do |format|
      format.json do
        render({ :json => @tasks.as_json })
      end

      format.html do
        render({ :template => "tasks/index.html.erb" })
      end
    end
  end

  def show
    the_id = params.fetch(:rt_task_id)
    @task = Task.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @task.as_json })
      end

      format.html do
        render({ :template => "tasks/show.html.erb" })
      end
    end
  end

  def create
    @task = Task.new

    @task.name = params.fetch(:name, nil)
    @task.due_on = params.fetch(:due_on, nil)

    if @task.valid?
      @task.save
      respond_to do |format|
        format.json do
          render({ :json => @task.as_json })
        end
  
        format.html do
          redirect_to("/tasks", { :notice => "Task created successfully."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @task.as_json })
        end
  
        format.html do
          redirect_to("/tasks", { :notice => "Task failed to create successfully."})
        end
      end
    end
  end

  def update
    the_id = params.fetch(:rt_task_id)
    @task = Task.where(:id => the_id).at(0)

    @task.name = params.fetch(:name, @task.name)
    @task.due_on = params.fetch(:due_on, @task.due_on)

    if @task.valid?
      @task.save
      respond_to do |format|
        format.json do
          render({ :json => @task.as_json })
        end
  
        format.html do
          redirect_to("/tasks/#{@task.id}", {:notice => "Task updated successfully."})
        end
      end
    else
      # render({:template => "/tasks/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @task.as_json })
        end
  
        format.html do
          render({ :template => "tasks/show.html.erb" })
        end
      end
    end
  end

  def destroy
    the_id = params.fetch(:rt_task_id)
    @task = Task.where({ :id => the_id }).first

    @task.destroy

  respond_to do |format|
    format.json do
      render({ :json => @task.as_json })
    end

    format.html do
      redirect_to("/tasks", {:notice => "Task deleted successfully."})
    end
  end
  end
end
