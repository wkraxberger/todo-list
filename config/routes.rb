Rails.application.routes.draw do
  root to: "todo_lists#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :todo_lists do
    resources :todo_items, only: [:create, :new, :edit, :show, :update, :destroy ]
  end

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
end
