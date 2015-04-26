class CommentsController < ApplicationController


  def show


  end
  

  def create
    
    @comment = current_user.comments.build()
    @comment[:user_id] = current_user.id
    @comment[:entry_id] = session[:entry_id]
    @comment[:comment] = params[:comment][:comment]
    if @comment.save
    redirect_to entry_path(session[:entry_id])
      else
    flash[:danger] = "Comment is blank or it so long."
    redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted successfully"
    redirect_to request.referrer || root_url
  end

  def new
    
  end

  private

    def comment_params
      params.require(:comment).permit(:comment, :entry_id)
    end


end
