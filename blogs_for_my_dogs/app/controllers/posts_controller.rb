class PostsController < ApplicationController
	before_action :authenticate_user!


	def index
		@posts = Post.all
	end

	def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
			redirect_to("/")
		else
			render :new
		end
	end

	private



	def post_params
		params.require(:post).permit(:author, :content)
	end

end