class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @binge = @user.binges.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
     flash[:notice] = "Welcome to the site!"
     session[:user_id] = @user.id
     redirect_to user_path(@user)
    else
     flash[:alert] = "There was a problem creating your account. Please try again."
     redirect_to :back
    end
  end
private
   def user_params
     params.require(:user).permit(:username, :password)
   end
end
