class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save

    redirect_to item_path(params[:id])

  end

private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id,item_id:params[:id])
  end
end


