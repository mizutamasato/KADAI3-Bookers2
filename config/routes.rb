Rails.application.routes.draw do
  #get 'users/edit'
  #get 'users/show'
  #get 'users/index'
  
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  devise_for :users

  resources :books#, only: [:create, :index, :show, :edit, :update, :destroy ]

  resources :users#, only: [:index, :show, :edit,  ]
  
  root to: "homes#top"
  
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
