class TasksController < ApplicationController
  before_action :set_task, only: [:update_order_position, :show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(completed: false).rank(:order_number).all
  end

  def review
    @tasks = Task.where(completed: true).rank(:order_number).all
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @last_task = Task.rank(:order_number).last
    @task = Task.create!(name: params[:task][:name], start_on: params[:task][:start_on],
        due_on: params[:task][:due_on], completed: params[:task][:completed],
        order_number:  @last_task.order_number + 1)
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_row_order
    @task = Task.find(task_params[:id])
    @task.order_number_position = task_params[:order_number_position]
    @task.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:id, :name, :start_on, :due_on, :completed, :order_number_position, :uid)
    end
end
