class TodosController < ApplicationController
before_action :authenticate_user!

  def index
    @todos = Todo.all
    @assignments = current_user.assignments
    @completed_todos = current_user.assignments.where(completed: true).count
  end
end
