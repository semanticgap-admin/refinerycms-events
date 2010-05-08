ActionController::Routing::Routes.draw do |map|
  map.resources :events

  map.namespace(:admin) do |admin|
    admin.resources :events
  end
end
