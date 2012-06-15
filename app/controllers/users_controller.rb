class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@user = current_user
  	@document = Document.new
  	@documents = current_user.documents.asc(:position)
  end
  def create
  end
  def destroy
  end
end
