class ReviewsController < ApplicationController
before_action :find_app
before_action :find_review, only: [:edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review=Review.new
	end

	def create
		@review=Review.new(review_params)
		@review.app_id=@app.id
		@review.user_id=current_user.id

		if @review.save
			redirect_to app_path(@app)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to app_path(@app)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to app_path(@app)
	end

	private
		def review_params
			params.require(:review).permit(:rating, :comment)
		end
		def find_app
			@app=App.find(params[:app_id])
		end
		def find_review
			@review=Review.find(params[:id])
		end
end
