Rails.application.routes.draw do

  # admin
  constraints subdomain: 'admin' do
    get :visit, :controller => :admin
    patch :visit, :controller => :admin
    get :contact, :controller => :admin
    patch :contact, :controller => :admin
    get :home, :controller => :admin
    patch :home, :controller => :admin
    get :artists, :controller => :admin
    patch :artists, :controller => :admin
    get :exhibits, :controller => :admin
    patch :exhibits, :controller => :admin
    resources :artists
    resources :exhibits
    resources :images, :controller => 'images'
    root :to => "admin#home", :as => 'admin_root'
  end

  # resources
  resources :artists, :only => [:show, :index]
  resources :exhibits, :only => [:show, :index]

  # home page
  root :to => "home#index"
  get "/home" => "home#index"

  # static
  %w(contact visit).each do |action|
    get "/#{action}" => "static##{action}"
  end

  # errors
  get '*a', :to => 'errors#routing'

end
