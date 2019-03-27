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

  def show
  @assignment = Assignment.find(params[:assignment_id])
  @todo = @assignment.todo
  @users = User.joins(:assignments).where(assignments: {completed: true, todo: @todo})
  @allusers = @users.order('name ASC')
  @ranking = @users.order('updated_at ASC').last(5)
  end
end
