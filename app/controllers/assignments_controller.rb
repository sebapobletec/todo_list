class AssignmentsController < ApplicationController
before_action :completed_todos, only: [:show, :change_status]
before_action :authenticate_user!

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

  def show
    @assignment = Assignment.find(params[:assignment_id])
    @todo = @assignment.todo
    @users = User.joins(:assignments).where(assignments: {completed: true, todo: @todo}).order('name ASC')
    @ranking = Assignment.joins(:todo).where(assignments: {completed: true, todo: @todo}).order('updated_at ASC').limit(5)
  end

  def completed_todos
    @todos = Todo.all
    @assignments = current_user.assignments
    @completed_todos = current_user.assignments.where(completed: true).count
  end


end
