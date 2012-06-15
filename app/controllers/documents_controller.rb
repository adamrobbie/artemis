class DocumentsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :html, :js, :json

	def create
		@document = current_user.documents.create!(params[:document])
		@document.save
		respond_with @document, location: root_path
	end
	def destroy
		@document = current_user.documents.find(params[:id])
		@document.destroy
		respond_with @document, location: root_path
	end
	def sort
		params[:document].each_with_index do |id, index|
			doc = current_user.documents.find(id)
			doc.update_attribute(:position, index) if doc
		end
		render nothing: true
	end

	def edit
		@document = current_user.documents.find(params[:id])
		respond_with @document, location: root_path
	end

	def update
		@document = current_user.documents.find(params[:id])
  		@document.update_attributes(params[:document])
        respond_with @document, location: root_path
	end

end
