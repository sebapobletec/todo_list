class TodosController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @assignments = @user.assignments
  end
end
