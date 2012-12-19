CfpMagmaCom::Application.routes.draw do
  mount Cfp::Engine => '/'
  root :to => "proposals#index"
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin
  get "sessions/new"
  get "sessions/create"
  get "sessions/failure"
  get "sessions/destroy"

  devise_for :users


end
