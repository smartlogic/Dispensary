Dispensary::Application.routes.draw do
  devise_for :users

  resources :organizations, :only => [:new, :show, :create]

  resources :apps, :only => [:new, :create, :show, :index] do
    resources :builds, :only => [:new, :create, :show, :download, :install] do
      member do
        get :download
        get :install, :defaults => { :format => 'plist' }
      end
    end
  end

  root :to => "welcome#index"
end
