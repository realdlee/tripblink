class CountriesController < ApplicationController
  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    @country.save
    redirect_to root_path
  end

  private
  def country_params
    params.require(:country).permit(:region_id, :name, :image)
  end
end