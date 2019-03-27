Rails.application.routes.draw do
  get 'assignments/create'
  get 'todos/index'
  devise_for :users, controllers:{
    registrations: 'user/registrations'
  }
  root to: 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
