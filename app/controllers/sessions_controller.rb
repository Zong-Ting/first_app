class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email]) #email比對 params為http reques的hash放可用變數
	if @user && @user.authenticate(params[:session][:password]) #密碼比對
	  sign_in(@user)
	  #session[:session_token] = @user.session_token #記錄登入者session
	  flash[:success] = "Welcome back, #{@user.name}" #flash訊息
	  redirect_to @user #轉跳頁面
	else
	  flash.now[:error] = "Invalid email/password combination"
	  render "new"
	end
  end

  def destroy
    sign_out
	redirect_to root_path
  end
end
