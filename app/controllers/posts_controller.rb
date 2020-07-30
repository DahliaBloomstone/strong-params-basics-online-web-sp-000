class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

#only title is permittable using permit method
#permit vs. require? require = restrictive. params must contain post key 
def create
 @post = Post.new(params.require(:post).permit(:title, :description))
 @post.save
 redirect_to post_path(@post)
end

def update
 @post = Post.find(params[:id])
 @post.update(params.require(:post).permit(:title))
 redirect_to post_path(@post)
end

	def edit
	  @post = Post.find(params[:id])
	end
end
