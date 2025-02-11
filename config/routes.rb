Rails.application.routes.draw do
  resources :books,except: [:new,]
  get '/' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
