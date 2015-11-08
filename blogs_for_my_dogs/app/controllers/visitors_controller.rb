class VisitorsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]

	def index
		@posts = Post.all
	end
	
end