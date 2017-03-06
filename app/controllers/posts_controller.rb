class PostsController < ApplicationController
	before_action :require_login
  def index
  	@user = User.find(session[:user_id])
  	@posts = Post.includes(:likes).order('likes.likes DESC')
 
  end

  def create
  	user = User.find(session[:user_id])
  	post = Post.create(content:params[:content], user:user)
  	redirect_to :back
  end

  def show
  	@post = Post.find(params[:id])
  	@likes = @post.likes
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to :back
  end
end
