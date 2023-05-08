class CommentsController < ApplicationController
  def create
    @magazines = Magazine.find_by(id: params[:magazine_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.magazine_id = @magazines.id
    @comment.save
  end
  
  def destroy
    @magazines = Magazine.find_by(id: params[:magazine_id])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
