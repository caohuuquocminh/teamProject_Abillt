class DemoController < ApplicationController
  
  def hello
  	#@apps = App.all
  	@blind = App.where(:category_id => 1)
  	@sightImpairment = App.where(:category_id => 2) 
    @learningDisabled = App.where(:category_id => 3)
  	#@apps = App.find(params[:id])
  	@categories = Category.order(:name)
  	@products = App.order(:name)
  	#@productsss = App.find(params[:id])
  end
  
end