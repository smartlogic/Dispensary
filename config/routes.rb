Dispensary::Application.routes.draw do
  resources :apps, :only => [:new, :create, :show, :index] do
    resources :builds, :only => [:new, :create, :show]
  end
  root :to => "welcome#index"
end
