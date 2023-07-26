Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments, 
        only: [:destroy, :create], shallow:true
     #resources :comments, only: [:show, :edit, :update, :destroy]
  end 
  
  namespace :api do
    namespace :v1 do
      resources :articles do
        member do
          patch:like
        end
      end        
    end
  end

 
    

  resources :users, except:[:index, :destroy, :show] do
    collection do
      get :login
      post :logining
      delete :logout
    end
  end

   
end
