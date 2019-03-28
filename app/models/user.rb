class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments, dependent: :destroy
  has_many :todos, through: :assignments
  after_create :load_todos

  private

  def load_todos
    @todos = Todo.all
    @user = User.last
    @assignments = []
    @todos.each do |todo|
      @user.assignments << Assignment.new(user: @user, todo: todo)
    end
  end
end
