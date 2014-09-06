class TasksController < ApplicationController
	before_action :task, :only => [:update, :edit, :destroy]
	before_action :challenge, :only => [:edit]

  def create
  	@task = challenge.tasks.new(tasks_params)
  	respond_to do |format|
  		if @task.save 
	  		format.html { redirect_to challenge_tasks_path(challenge), notice: 'Task was successfully created.' }
        format.js 
	  	else
        @tasks = challenge.tasks
	  		format.html { render :index }
        format.js
	  	end
	  end
  end

  def update
  	#task
  	respond_to do |format|
		if @task.update(tasks_params)
	  		format.html { redirect_to challenge_tasks_path(challenge), notice: 'Task was successfully updated.' }
	  	else
        @tasks = challenge.tasks
	  		format.html { render :edit }
	  	end
  	end
  end

  def edit
  	#challenge
  	#task
  end

  def destroy
  	respond_to do |format|
      if @task.destroy
        format.html { redirect_to challenge_tasks_path, notice: 'You have successfully remove a task' }
        format.js
      else
        format.html { redirect_to challenge_tasks_path, alert: 'Removing task was failure.' }
        format.js { render :js => "alert('remove_fail')"}
      end
    end
  end

  def index
  	@tasks = challenge.tasks
  	@task = Task.new
  end

  private
  def tasks_params
  	params.require(:task).permit(:name, :type, :point)
  end
  def challenge
  	@challenge = Challenge.find(params[:challenge_id])
  end
  def task
  	@task = Task.find(params[:id])
  end
end
