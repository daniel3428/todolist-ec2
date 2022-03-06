class SecTodosController < ApplicationController
  before_action :set_sec_todo, only: %i[ show update destroy ]

  # GET /sec_todos
  def index
    @sec_todos = SecTodo.all

    render json: @sec_todos
  end

  # GET /sec_todos/1
  def show
    render json: @sec_todo
  end

  # POST /sec_todos
  def create
    @sec_todo = SecTodo.new(sec_todo_params)

    if @sec_todo.save
      render json: @sec_todo, status: :created, location: @sec_todo
    else
      render json: @sec_todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sec_todos/1
  def update
    if @sec_todo.update(sec_todo_params)
      render json: @sec_todo
    else
      render json: @sec_todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sec_todos/1
  def destroy
    @sec_todo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sec_todo
      @sec_todo = SecTodo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sec_todo_params
      params.require(:sec_todo).permit(:title, :completed, :itemclass, :note, :todo_id)
    end
end
