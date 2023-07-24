class CommentController < ApplicationController
  before_action :authenticated_user!
  before_action :find_article, only: [:create]
  def create
    # @comment = Comment.new(comment_params)
    # @comment.user = current_user
    # @comment.artcile = @artcile
    @comment = @artcile.comments.new(comment_params)

    if @comment.save
      #redirect_to articles_path(@artcile), notice: '留言成功'
    else
      render "articles/show"
    end
  end

  private
  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user: current_user)
  end
end
