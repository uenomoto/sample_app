Rails.application.routes.draw do
    get root to: "homes#top"
    resources :lists
  end
