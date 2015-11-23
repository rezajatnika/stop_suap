class StoriesController < ApplicationController
  def new
    @story = Story.new
    @location = @story.build_location
  end

  def create
    @story = Story.new(story_params)
    @location = @story.build_location(location_params)
    if @story.save
      @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def story_params
    params.require(:story).permit(
      :title, :content, :amount, :event_date, :category_id
    )
  end

  def location_params
    params.require(:location).permit(:story_id, :city_id, :province_id)
  end
end
