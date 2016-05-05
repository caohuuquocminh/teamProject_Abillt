class AppsController < ApplicationController
	before_action :find_app, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def index
		#if params[:category].blank?
		#@appss=App.all.order("created_at DESC")
		@apps = App.all
		#else
			#@category_id = Category.find_by(name: params[:category]).id
			#@apps = App.where(:category_id => @category_id).order("created_at DESC")
		#end	
	end

	def show
		@apps = App.find(params[:id])

		#if @apps.reviews.blank?
		#	@average_review=0
		#else
		#	@average_review=@apps.reviews.average(:rating).round(2)
		#end
	end

	def new
		@apps = App.new
		@categories = Category.order(:name)
		#@apps=current_user.apps.build
		#@categories = Category.all.map{ |c| [c.name, c.id] }

	end

	def create
		@apps = App.new(app_params)

		respond_to do |format|
			if @apps.save
				format.html { redirect_to @apps, notice: 'App was successfully created.' }
				format.json { render :show, status: :created, location: @apps }
			else
				format.html { render :new }
				format.json { render json: @apps.errors, status: :unprocessable_entity }
			end
		end
		#@apps=current_user.apps.build(app_params)
		#@apps.category_id = params[:category_id]

		#if @apps.save
		#	redirect_to root_path
		#else
		#	render 'new'
		#end
	end

	def edit
		#@categories = Category.all.map{ |c| [c.name, c.id] }
		@apps = App.find(params[:id])
		@categories = Category.order(:name)
	end

	def update
		@apps = App.find(params[:id])
		respond_to do |format|
			if @apps.update(app_params)
				format.html { redirect_to @apps, notice: 'App was successfully updated.' }
				format.json { render :show, status: :ok, location: @apps }
			else
				format.html { render :edit }
				format.json { render json: @apps.errors, status: :unprocessable_entity }
			end
		end
		#@apps.category_id = params[:category_id]
		#if @apps.update(app_params)
		#	redirect_to app_path(@apps)
		#else
		#	render 'edit'
		#end
	end

	def destroy

		@apps = App.all
		@apps.destroy(params[:id])
		respond_to do |format|
			format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def app_params
		params.require(:app).permit(:name, :rating, :image, :description, :link, :developer, :operation, :price, :category_id)
		
	end

	def set_app
		@appss = App.find(params[:id])
	end

	def find_app
		@appss=App.find(params[:id])
	end
end
