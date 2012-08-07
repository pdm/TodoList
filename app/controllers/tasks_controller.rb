class TasksController < ApplicationController
  respond_to :json

  # GET /tasks.json
  def index
    respond_with Task.all
  end

  # POST /accounts.json
  def create
    respond_with Task.create(params[:task])
  end

  # DELETE /tasks/1.json
  def destroy
    respond_with Task.destroy(params[:id])
  end 
end
