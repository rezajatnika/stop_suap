class Api::V1::LocationsController < ApplicationController
  def map_data
    respond_to do |format|
      format.json { render json: get_map_data }
    end
  end

  private

  def get_map_data
    @provinces = Province.all
    @locations = Location.includes(:province)
    @provinces.map do |province|
      {
        'hc-key': province.code,
        'value': @locations.where(province_id: province.id).count
      }
    end
  end
end
