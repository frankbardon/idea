ActionController::Routing::Routes.draw do |map|
  map.resources :pieces


  map.login  "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resources :ideas
  map.resources :user_sessions
  map.resources :users

  map.root :controller => "pages"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
