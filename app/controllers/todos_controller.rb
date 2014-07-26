class TodosController < ApplicationController
  
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params.required(:todo).permit(:description))
    @todo.save
    redirect_to todos_path
  end

end