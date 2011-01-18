Dispensary::Application.routes.draw do
  resources :apps, :only => [:new, :create, :show, :index] do
    resources :builds, :only => [:new, :create, :show, :download] do
      member do
        get :download
      end
    end
  end
  root :to => "welcome#index"
end
