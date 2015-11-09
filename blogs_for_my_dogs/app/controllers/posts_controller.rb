class PostsController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:index]
	before_action :authenticate_user!, only: [:create, :edit, :update]
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def about

	end

	def archive
		@posts = Post.all.order("created_at DESC")
		@post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
	end

	def contact

	end

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
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
	
	end

	def edit

	end

	def update
		
		if @post.user_id = current_user.id
			if @post.update(post_params)
				redirect_to @post
			else
				render :action => :edit
			end
		else
			redirect_to @post
		end
	end

	def destroy
		@post.destroy
		redirect_to '/posts'
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:id, :author, :content, :user_id)
	end

end