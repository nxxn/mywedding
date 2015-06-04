Rails.application.routes.draw do

  scope "(:locale)", :locale => /en|ru|lv/ do

    devise_for :users

    namespace :admin do
      root :to => "articles#index"

      resources :articles
    end

  end

end
