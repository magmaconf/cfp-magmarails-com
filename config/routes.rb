Rails.application.routes.draw do
  mount Cfp::Engine => '/'
  root :to => "proposals#index"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  post '/signin' => 'sessions#new', :as => :signin
  get "sessions/new"
  get "sessions/create"
  get "sessions/failure"
  get "sessions/destroy"
  get "/talks/:page" => "talks#index", as: 'talks'

  scope module: 'cfp' do
    get '/ranked-proposals' => 'ranked_proposals#index'
  end

  devise_for :users

  match '/send_mail', to: 'contact#send_mail', via: 'post'

end
