class Api::V1::ArticlesController < ApplicationController
  before_action :authenticated_user!
  
  def like
    article = Article.find(params[:id])

    status = current_user.toggle_like(article)
    render json:{liked: status}

    # #如果喜歡該文章
    # if current_user.liked?(article)
    # #變不喜歡
    #   current_user.unlike!(article)
    #   render json: {liked: false, id:params[:id]}
    # #變喜歡
    # else
    #   current_user.like!<< article
    #   renser json: {liked: true, id:params[:id]}
  end
end
