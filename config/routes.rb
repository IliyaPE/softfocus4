Softfocus::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'legacy' => 'images#new', :as => :legacy, :defaults => {:mode => :legacy}
  match 'upload' => 'images#create', :as => :upload, :via => :post
  match ':id' => 'images#show', :as => :result
  match ':id/download' => 'images#download', :as => :download

  namespace :admin do
    resources :images
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'images#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
