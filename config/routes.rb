Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", :locale => /en|ru|lv/ do

    devise_for :users

    resources :articles
    resources :works, only: [:index]

    get 'tags/:tag', to: 'articles#index', as: :tag

    namespace :admin do
      root to: "articles#index"

      resources :articles
      resources :works

      get 'tags/:tag', to: 'articles#index', as: :tag
    end

    root to: "home#index"

  end

  get '/submit_wish', to: 'works#submit_wish'
  post '/send_greeting', to: 'works#send_greeting'

  get '/:key(/*path)' => 'works#show'

end
