class PostsController < ApplicationController
before_action :authenticate_user, only: [:create, :index, :destroy]
  def destroy
    @post = Post.find(params[:id]) #找文章ID
	if current_user?(@post.user) #確認本人文章
	  @post.destroy #刪除
	  flash[:success] = "刪除成功"
	  redirect_to posts_path
	else
	  flash[:error] = "刪除失敗"
	  redirect_to posts_path
	end
  end
  def index
    @posts = Post.from_followed_users(current_user).order('created_at DESC')
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
