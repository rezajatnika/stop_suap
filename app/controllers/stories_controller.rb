class StoriesController < ApplicationController
  def new
    @story = current_user ? current_user.stories.new : Story.new
  end

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments
  end

  def edit
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.includes(:category, location: [:city, :province]).all
    @search = Story.ransack(params[:q])
    @stories = @search.result.includes(:category, :location)
  end

  def create
    @story = current_user ?
      current_user.stories.new(story_params) : Story.new(story_params)

    if @story.save
      redirect_to @story, success: 'Report created!'
    else
      flash.now[:warning] = 'Please review your report again.'
      render :new
    end
  end

  private

  def story_params
    attr = [
      :title, :content, :amount, :event_date, :category_id, :email,
      location_attributes: [:city_id, :province_id]
    ]
    params.require(:story).permit(*attr)
  end
end
