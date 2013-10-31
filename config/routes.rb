Stuffwithfriends::Application.routes.draw do
  
  resources :users, :only => [:show] do
    resources :items, :only => [:new, :edit, :create, :update, :delete]
    resources :conversations, :only => [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end
  end


resources :items, :only => [:index, :show]


  get '/borrowings/:id/accepted', :to => "borrowings#accepted", as: "accepted_borrowing"
  get '/borrowings/:id/declined', :to => "borrowings#declined", as: "declined_borrowing"


  get '/logout', :to => "sessions#destroy"
  get '/auth/:provider/callback', :to => "sessions#create"
  get '/auth/failure', redirect('/')


  root :to => 'pages#index'
end
