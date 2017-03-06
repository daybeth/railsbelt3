class LikesController < ApplicationController
	before_action :require_login
	def create
		user = User.find(session[:user_id])
		post = Post.find(params[:id])
		liked = Like.where(user:user,post:post).first
		unless liked
			Like.create(user:user,post:post, likes:likes=1)
			redirect_to :back
		else
			likes = liked.likes+=1
			liked.update(likes:likes)
			redirect_to :back
		end
	end
end	
