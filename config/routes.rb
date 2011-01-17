Dispensary::Application.routes.draw do
  resources :apps, :only => [:new, :create, :show, :index]
  root :to => "welcome#index"
end
