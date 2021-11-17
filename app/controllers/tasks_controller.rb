class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section, only: %i[ index new create ]
  before_action :set_project, only: %i[ index new create ]
  before_action :set_task, only: %i[ show edit update destroy ]

  def new
    @task = @section.tasks.build
  end

  def edit
  end

  def create
    @task = @section.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { redirect_to @project, alert: "Task creation error." }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task.section.project, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { redirect_to @project, alert: "Task update error." }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @task.section.project, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Section.find(params[:section_id]).project
  end

  def set_section    
    @section = Section.find(params[:section_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :priority, :status, :section_id)
  end
end
