class StoriesController < ApplicationController
  def new
    @story = Story.new
    @location = @story.build_location
  end

  def show
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.all
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    @location = @story.build_location(location_params)

    byebug

    if @story.save && @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def story_params
    params.require(:story).permit(
      :title, :content, :amount, :event_date, :category_id, :email
    )
  end

  def location_params
    params.require(:location).permit(:city_id, :province_id)
  end
end
