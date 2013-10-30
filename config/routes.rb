Stuffwithfriends::Application.routes.draw do
  get '/logout', :to => "sessions#destroy"
  get '/auth/:provider/callback', :to => "sessions#create"
  get '/auth/failure', redirect('/')
end
