class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(create_params)
	posts.build
	if @post.save
	  flash[:success] = "Posted successfully"
	  redirect_to root_path
	else
	  render "new"
	end
  end
  
  private
  
  def create_params
    params.require(:post).permit(:content)
  end
  
end
