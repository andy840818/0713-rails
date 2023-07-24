class ArticlesController < ApplicationController
   before_action :set_article, only: [:show ]
   before_action :set_user_article, only: [:edit, :destroy, :update ]
   #include UsersHelper
   before_action :authenticated_user!, except: [:index, :show]


  def index
    @u = current_user
    @articles = Article.includes(:user).order(id: :desc)
  end

  def new
    @article = Article.new
  end 

  def create
    #寫入資料庫
    #OBRM
      #@article = Article.new(article_params) #清洗過的article_params
      @article = current_user.articles.new(article_params) 
                #因為有做 has_many  
      @article.user = current_user # @artcile.user_id = current_user_id
      # @article.save
      #存檔完 , 頁面轉入 /articles
      # flash[:notice] = "你媽超胖!!!"
      if @article.save
        redirect_to "/articles", notice: "大吉大利!!!"
      else
        #  redirect_to "/articles/new", alert: "是不會寫東西喔? 糙"
        render :new  #借頁面 拿new.html.erb => redirect_to "/articles/new"
      end
  end
 
  def destroy
    @article.destroy
    redirect_to gitarticles_path, notice: '刪除成功'
  end

  def show
     #判斷是否找的到ID

      # @article = Article.find(params[:id])
        # render html: @article.title # 交給 view 做
      #從Rails的根目錄拿取404檔案 ,  => 共通方法放在上層
      # render file: Rails.root.join('public','404.html'), 
      #       status:404, #為存在的頁面 200 , 加上狀態:表示為不存在的頁面404
      #       layout: false # 為獨立的頁面 , 不加其他的東西             
    # rescue
    #   render html: "是在找什麼啦?" 
    @comment = Comment
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update 
  #  @article = Article.find(params[:id])

   if @article.update(article_params)
    redirect_to articles_path, notice:'更新成功'
   else
    render :edit
   end

  end

  private
    #Strong Paramenter 強參數
  def article_params #清洗 (如果寫入的資料一個一個指定就可以不用洗)
    article_params = params.require(:article)
                           .permit(:title, :content, :sub_title) #如果有加欄位要加,才能寫進資料庫
                          #.merge(user: current_user)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_user_article
    @article = current_user.articles.find(params[:id])
  end

end
