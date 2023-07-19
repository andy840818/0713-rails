Rails.application.routes.draw do
  root 'articles#index' #等於 get '/' ,to:'articles#index', as: 'root'
  
  get '/articles',to:'articles#index'
  post '/articles',to:'articles#creat'
  get '/articles/new',to:'articles#new', as:'new_article' 
  # 單一頁面
  get '/articles/:id',to:'articles#show', as: 'article'
  get '/articles/:id/edit',to:'articles#edit', as: 'edit_article'
  patch '/articles/:id',to:'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  resources :users, except:[:index, :destroy, :show] do
    collection do
      get :login
      post :logining
    end
  end

end
