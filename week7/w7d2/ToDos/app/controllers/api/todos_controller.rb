class Api::TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def new

  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: { errors: todo.errors.full_messages }, status: 422
    end
  end

  def edit
    todo = Todo.find(params[:id])
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render
      render json: { errors: todo.errors.full_messages }, status: 422
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    render json: "AHHH FUCKKK!!! deleted"
  end

  def show
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body,  :done)
  end
end
