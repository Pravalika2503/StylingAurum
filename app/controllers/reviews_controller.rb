class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.jewel
	end

	def destroy
		@review = Review.find(params[:id])
		jewel = @review.jewel
		@review.destroy

		redirect_to jewel
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :jewel_id)
		end
end