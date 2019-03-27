class TodosController < ApplicationController
before_action :authenticate_user!

  def index
    @todos = Todo.all
    @assignments = current_user.assignments
  end
end
