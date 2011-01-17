Dispensary::Application.routes.draw do
  resources :apps, :only => [:new, :create, :show]
  root :to => "welcome#index"
end
