class CommentsController < ApplicationController
  def create
    magazine = Magazine.find_by(id: params[:magazine_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.magazine_id = magazine.id
    comment.save
    redirect_to magazine_path(magazine)
  end
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to magazine_path(params[:magazine_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
