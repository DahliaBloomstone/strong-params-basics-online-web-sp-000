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

	def edit
	  @post = Post.find(params[:id])
	end

#only title is permittable using permit method
#permit vs. require? require = restrictive. params must contain post key
def create
  @post = Post.new(post_params(:title, :description))
  @post.save
  redirect_to post_path(@post)
end

def update
  @post = Post.find(params[:id])
  @post.update(post_params(:title))
  redirect_to post_path(@post)
end

private

#should come after other methods:
#abstract the strong parameter call into its own method controller
#def post_params
#  params.require(:post).permit(:title, :description)
#end
# pass permitted fields in as *args -> post_params dry ->
def post_params(*args)
  params.require(:post).permit(*args)
end

end
