class UsersController < ApplicationController
	before_action :require_login, except:[:index,:create]
  def index
  end


  def create
  	user = User.new(user_params)

	 if user.save 
  		flash[:success] = "You have registered successfully. Please Log in"
  		redirect_to :back
		else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
		end
  end

   def show
   	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)  	
  end
 
end
