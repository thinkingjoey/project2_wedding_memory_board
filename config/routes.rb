Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'profile'=> 'boards#profile'

  devise_for :users
  # resources :pictures
  get '/boards/match' => 'boards#search', as: :search_board
  post '/boards/:board_id' => 'boards#match', as: :match_board
  get '/boards/code/:code' => 'boards#code_show'
  resources :boards


  get '/pictures' => 'pictures#index'
  post '/boards/:board_id/pictures' => 'pictures#create', as: :create_picture
  get '/boards/:board_id/pictures/new' => 'pictures#new', as: :new_picture
  get '/pictures/:id/edit' => 'pictures#edit', as: :edit_picture
  patch '/pictures/:id' => 'pictures#update', as: :update_picture
  delete '/pictures/:id' => 'pictures#destroy', as: :destroy_picture

end
