Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
end
