Rails.application.routes.draw do
  get 'items/posts'
  devise_for :users
end
