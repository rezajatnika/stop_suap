class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @comment = Comment.new(secure_params)
    @comment.story = @story
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  private

  def secure_params
    params.require(:comment).permit(:body)
  end
end
