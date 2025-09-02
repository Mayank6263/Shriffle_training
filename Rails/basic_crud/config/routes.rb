Rails.application.routes.draw do
  root to: "users#index"
  # resources :users #, [:create, :update, :destroy]
  # get "users/create"
  # get "users/update"
  # get "users/destroy"
  # get "posts/index"
  # resources :posts, only: :index

  # resources :users do
  #   collection do
  #     get 'search'
  #   end
  # end

  # get 'search' on: :collection

  # resources :products do
  #   member do
  #     get 'show'
  #   end
  # end
# =>  creates 14 routes
  # resources :users do
  #   resources :products#, shallow: true , only: [:index, :new, :create]
  # end



                        #Namespace
# =>  will change the prefix with controller action i.e show_users_product
# =>  used to change url path, prefix and controller action
  # namespace :users do
  #   resources :products
  # end


                      #Scope
# => will not change the prefix as well as controller action column i.e new_product
# =>  basically used to change url path  
  # scope 'api' do
  #   resources :products
  # end

# => to change structure of controller#action use module: with scope
  # scope module: 'users' do
  #   resources :products
  # end

# => to change structure of url use path: with scope
  # scope path: 'users' do
  #   resources :products
  # end

# => to change structure of prefix use as: with scope
  # scope as: 'users' do
  #   resources :products
  # end

                      #Concerns
  concern :commentable do
    resources :comments
  end


end