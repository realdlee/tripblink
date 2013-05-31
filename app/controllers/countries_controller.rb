class CountriesController < ApplicationController
  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    @country.save
    redirect_to root_path
  end

  def index
    @countries = Country.all
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    # if @country.update_attributes(params[:country]) ForbiddenAttributes error
    if @country.update_attributes(country_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @country = Country.find(params[:id])
    @comments = @country.comments
    @comment = @country.comments.new
  end

  def destroy
    Country.find(params[:id]).destroy
    flash[:success] = "Country deleted"
    redirect_to root_path
  end

  private

  # def country
  #   @_country ||= Country.find(params[:id])
  # end

  def country_params
    params.require(:country).permit(:region_id, :name, :image)
  end
end