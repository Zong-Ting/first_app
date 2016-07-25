class PostsController < ApplicationController
  def index
    @posts = Post.all
	@post = current_user.posts.build
  end
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(create_params)
	if @post.save
	  flash[:success] = "Posted successfully"
	  redirect_to posts_path
	else
	  render "new"
	end
  end
  
  private
  
  def create_params
    params.require(:post).permit(:content)
  end
  
end
