class Api::V1::LocationsController < ApplicationController
  def map_data
    respond_to do |format|
      format.json { render json: get_map_data }
    end
    Province.connection.reconnect!
  end

  def pie_data
    respond_to do |format|
      format.json { render json: get_pie_data }
    end
    Category.connection.reconnect!
  end

  def province_data
    respond_to do |format|
      format.json { render json: get_province_data }
    end
    Category.connection.reconnect!
  end

  private

  # FIXME: Move to model or helper
  def get_map_data
    @provinces = Province.all
    @locations = Location.includes(:province)
    Parallel.map(@provinces, in_threads: 2) do |province|
      {
        'hc-key': province.code,
        'value': @locations.where(province_id: province.id).count
      }
    end.unshift({ 'hc-key': 'id-3700', 'value': 0 })
    # @provinces.map do |province|
    #   {
    #     'hc-key': province.code,
    #     'value': @locations.where(province_id: province.id).count
    #   }
    # end.unshift({ 'hc-key': 'id-3700', 'value': 0 })
  end

  # FIXME: Move to model or helper
  def get_pie_data
    @categories = Category.includes(:stories).all
    Parallel.map(@categories, in_threads: 2) do |category|
      {
        'name': category.name,
        'y': Story.count.zero? ?
          0 : category.stories.count.to_f / Story.count * 100,
        'drilldown': category.name
      }
    end
    # @categories.map do |category|
    #   {
    #     'name': category.name,
    #     'y': Story.count.zero? ?
    #       0 : category.stories.count.to_f / Story.count * 100,
    #     'drilldown': category.name
    #   }
    # end
  end

  # FIXME: Move to model or helper
  def get_province_data
    @categories = Category.includes(:stories).all
    @provinces = Province.all

    Parallel.map(@categories, in_threads: 2) do |category|
      {
        'name': category.name,
        'id': category.name,
        'data': @provinces.map do |province|
          [
            province.name,
            category.stories.count.zero? ?
              0 : story_count(province, category) /
                  category.stories.count.to_f * 100
          ]
        end
      }
    end

    # @categories.map do |category|
    #   {
    #     'name': category.name,
    #     'id': category.name,
    #     'data': @provinces.map do |province|
    #       [
    #         province.name,
    #         category.stories.count.zero? ?
    #           0 : story_count(province, category) /
    #               category.stories.count.to_f * 100
    #       ]
    #     end
    #   }
    # end
  end

  def story_count(province, category)
    @stories = Story.includes(:location).where(category_id: category.id)
    @stories.joins(
      'LEFT OUTER JOIN locations ON locations.story_id = stories.id'
    ).where('locations.province_id = ?', province.id).count
  end
end
