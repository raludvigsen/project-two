class PostsController < ApplicationController
	before_action :authenticate_user!, only:


	def index
		@posts = Post.all
	end

	def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
			redirect_to("/posts")
		else
			render :new
		end
	end

	def show
		@test = "Testing show"
	end

	def update
		if @post.update(car_params)
			redirect_to @post
		else
			render :action => :edit
		end
	end

	private
	def post_params
		params.require(:post).permit(:author, :content)
	end

end