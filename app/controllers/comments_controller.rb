class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @user_of_item = User.find(@comment.item.seller_id)
    if @comment.save
        respond_to do |format|
        format.json
      end
    else
      flash[:aleat] = "保存できていません"
      redirect_to item_path(params[:id])
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment: "出品者によって、このコメントは削除されました。
                              下ネタはやめてください！")
    redirect_to item_path(@comment.item_id)
  end

private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id,item_id:params[:id])
  end
end


