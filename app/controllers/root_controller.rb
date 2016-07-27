class RootController < ApplicationController
  def home
    def sandbox
    end
	redirect_to posts_path if signed_in?
  end
end
