class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		jewel= @photo.jewel

		@photo.destroy
		@photos = Photo.where(jewel_id: jewel.id)

		respond_to :js
	end
end