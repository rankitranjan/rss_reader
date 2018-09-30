Rails.application.routes.draw do
  # resources :articles
  
  resources :feeds do
  	resources :articles
	  # member do
	  #   get :articles
	  # end
  end

  # get '/all-feeds' => "feeds#index"
  get '/' => "feeds#home"

  root :to => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
