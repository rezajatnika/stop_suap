class StoriesController < ApplicationController
  def new
    @story  = current_user ? current_user.stories.new : Story.new
    @cities = City.all
  end

  def show
    @story    = Story.find(params[:id])
    @comments = @story.comments
  end

  def index
    @stories = Story.includes(:category, location: [:city, :province]).all
      .paginate(page: params[:page], per_page: 10)
    @search  = Story.ransack(params[:q])
    @stories = @search.result.includes(:category, location: [:city, :province])
      .paginate(page: params[:page], per_page: 10)
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

  def update_cities
    province = Province.find(params[:province_id])
    @cities  = province.cities.map { |city| [city.name, city.id] }
      .insert(0, 'Silahkan pilih')
  end

  private

  def story_params
    attr = [
      :title, :content, :amount, :event_date, :category_id, :email, :paid,
      :name, location_attributes: [:city_id, :province_id]
    ]
    params.require(:story).permit(*attr)
  end
end
