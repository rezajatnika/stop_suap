class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(secure_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js
        format.json { render json: @comment, status: :created}
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def secure_params
    params.require(:comment).permit(:body)
  end
end
