CfpTest::Application.routes.draw do
  devise_for :users

  mount Cfp::Engine => 'cfp'
end
