Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    #resources :comments, only: [:index, :new, :create] 
    resources :comments, 
    only: [:destroy, :create], shallow:true
  end

  #resources :comments, only: [:show, :edit, :update, :destroy]
    

  resources :users, except:[:index, :destroy, :show] do
    collection do
      get :login
      post :logining
      delete :logout
    end
  end

end
