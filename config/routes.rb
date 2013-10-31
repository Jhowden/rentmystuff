Stuffwithfriends::Application.routes.draw do
  
  resources :users, :only => [:show] do
    resources :items, :only => [:new, :edit, :create, :update, :delete]
  end

  resources :items, :only => [:index, :show]

  get '/logout', :to => "sessions#destroy"
  get '/auth/:provider/callback', :to => "sessions#create"
  get '/auth/failure', redirect('/')

  root :to => 'pages#index'
end
