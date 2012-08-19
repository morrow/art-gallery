RestonartgalleryCom::Application.routes.draw do

  # admin
  constraints :subdomain => "admin" do
    scope :module => "admin", :as => "admin" do
      get :home
      put :home
      get :help
      get :artists
      get :exhibits
      get :contact
      put :contact
      get :visit
      put :visit
    end
    resources :artists
    resources :exhibits
    resources :images
    root :to => "admin#index"
  end

  # resources
  resources :artists, :only => [:show, :index]
  resources :exhibits, :only => [:show, :index]

  # home page
  root :to => "home#index"
  get "/home" => "home#index"

  %w(contact visit).each do |action|
    get "/#{action}" => "static##{action}"
  end

  # Error 
  match '*a', :to => 'errors#routing'

end
