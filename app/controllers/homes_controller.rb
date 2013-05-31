class HomesController < ApplicationController
  def index
    @country = Country.new
    @countries = Country.all
  end
end
