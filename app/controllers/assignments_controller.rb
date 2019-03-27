class AssignmentsController < ApplicationController
  def create
      @todos = Todo.all
      @user = current_user
      @assignments = []
      @todos.each do |todo|
        @user.assignments << Assignment.new(user: current_user, todo: todo)
      end
      redirect_to root_path
  end
end
