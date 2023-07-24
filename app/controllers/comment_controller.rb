class CommentController < ApplicationController
  before_action :authenticated_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.artcile = @artcile

    if @comment.save
      redirect_to articles_path(@artcile), notice: '留言成功'
    else
      render "articles/show"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
