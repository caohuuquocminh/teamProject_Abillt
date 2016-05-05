class StoreController < ApplicationController
  def index
  	@products = App.order(:name)
  end

  def show
  	@product = App.find(params[:id])
  end
end
