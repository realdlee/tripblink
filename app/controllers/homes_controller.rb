class HomesController < ApplicationController
  def index
    @country = Country.new
  end
end
