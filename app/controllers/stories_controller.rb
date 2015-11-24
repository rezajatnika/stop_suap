class StoriesController < ApplicationController
  def new
    @story = current_user ? current_user.stories.new : Story.new
    @location = @story.build_location
  end

  def show
    @story = Story.find(params[:id])
    logger.info("Showing story: #{@story}")
  end

  def index
    @stories = Story.includes(:category, location: [:city, :province]).all
    logger.info("Showing #{@stories.size} stories")
  end

  def create
    @story = current_user ?
      current_user.stories.new(story_params) : Story.new(story_params)
    @location = @story.build_location(location_params)

    if @story.save && @location.save
      logger.info("Story created: #{@story}")
      redirect_to root_path, success: 'Report created!'
    else
      logger.info("Fail create story: #{@story}")
      render :new
    end
  end

  private

  def story_params
    attr = [:title, :content, :amount, :event_date, :category_id, :email]
    params.require(:story).permit(*attr)
  end

  def location_params
    params.require(:location).permit(:city_id, :province_id)
  end
end
