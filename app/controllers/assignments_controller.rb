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

  def change_status
    @assignment = Assignment.find(params[:assignment_id])
    if  @assignment.completed?
      @assignment.completed = false
    else
      @assignment.completed = true
    end

    @assignment.save
    redirect_to root_path
  end
end
