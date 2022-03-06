class TodosController < ApplicationController

    before_action :set_todo, only: [:show, :update, :destroy]

    def index
        @todos = User.find(params[:user_id]).todos
        render json: @todos
    end

    def show
        render json: @todo
    end

    def create
        @todo = User.find(todo_params[:user_id]).todos.build(todo_params)
        if @todo.save
            render json: @todo
        else
            render json: @todo.errors, status: unprocessable_entity
        end
    end

    def update
        if @todo.update(todo_params)
            render json: @todo
        else
            render json: @todo.errors, status: unprocessable_entity
        end
    end

    def destroy
        @todo.destroy
    end

    
    private
        def set_todo
            @todo = Todo.find(params[:id])
        end

        def todo_params
            params.require(:todo).permit(:id, :title, :completed, :itemclass, :note, :user_id)
        end
end
