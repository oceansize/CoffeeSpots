class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def sign_up
  	@user = User.require(params[:id, :email])
  end

end

def user_params
	params[:user].permit(:id)
	params[:user].permit(:email)
end