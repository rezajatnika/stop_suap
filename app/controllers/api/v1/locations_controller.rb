class Api::V1::LocationsController < ApplicationController
  def map_data
    respond_to do |format|
      format.json { render json: get_map_data }
    end
  end

  def pie_data
    respond_to do |format|
      format.json { render json: get_pie_data }
    end
  end

  def province_data
    respond_to do |format|
      format.json { render json: get_province_data }
    end
  end

  private

  # FIXME: Move to model or helper
  def get_map_data
    Location.joins(:province).group(:code).count.map do |key, val|
      { 'hc-key': key, 'value': val }
    end
  end

  # FIXME: Move to model or helper
  def get_pie_data
    count = Story.count
    Story.group(:category).count.map do |key, value|
      {
        'name': key.name,
        'drilldown': key.name,
        'y': count.zero? ? 0 : value.to_f / count * 100
      }
    end
  end

  # FIXME: Move to model or helper
  def get_province_data
    total = Story.group(:category).count.each_with_object({}) do |(k, v), o|
       o[k.id] = v
    end

    Category.select(:id, :name).map do |cat|
      {
        'name': cat.name,
        'id': cat.name,
        'data': location_join(cat.id).count.map do |key, val|
          [
            key.name,
            total.fetch(cat.id).zero? ? 0 : val.to_f / total.fetch(cat.id) * 100
          ]
        end
      }
    end
  end

  def location_join(id)
    Location.joins(:story).group(:province).where('stories.category_id = ?', id)
  end
end
