Uhloop::Application.routes.draw do
  get 'home/index'
  post 'home/create'
  root :to => 'home#index'
end
