class CommentsController < ApplicationController
  def create
    # render text: params
    @comment = Comment.new(comment_params)
    @comment.idea_id = params[:idea_id];
    if @comment.save
      redirect_to :back, notice: "Comment saved"
    else
      redirect_to :back, notice: "Sorry, couldnt save your comment"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :idea_id)
  end
end
