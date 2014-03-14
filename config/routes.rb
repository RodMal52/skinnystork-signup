SkinnystorkSignup::Application.routes.draw do




  get "content/bold_moves"
  get "content/fusion"
  get "content/fit_lifestyle"
  resources :payments

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  resources :charges
    
  devise_for :users, :controllers => {:registrations => 'registrations'}
  
  namespace :admin do
    root "base#index"
    resources :users  
    resources :user_steps
  end
  
end
