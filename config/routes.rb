Rails.application.routes.draw do


  mount ActionCable.server => '/cable'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {
    sessions: 'sessions',
    passwords: 'passwords',
    confirmations: 'confirmations',
    :registrations => 'registrations'
  }
  get "home/index" 
  root to: 'home#index'

  resources :messages
# get "jobs/download_pdf"


  namespace :recruiters do
    resources :dashboard do
      collection do
          get  :my_account
          post  :my_account
          get  :user_list
          get  :chat_with_candidate
      end
    end 
    resources :jobs  do
      collection do
          get  :candidates
          get  :download_pdf
      end
    end
  end


  namespace :applicants do
    resources :dashboard do
      collection do
        match  :job, via: [:get,  :post]
        get :my_applications
      end
    end 

    resources :jobs, only: :show do
      member do
        post  :apply_job
        get  :add_to_favorites
        put :favorite
      end
      collection do
        get  :my_favourite_jobs
      end
    end 
    
    # resources :recipes do
    # end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
