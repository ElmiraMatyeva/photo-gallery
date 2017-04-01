class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
   @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, your account has been successfully created!"
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success] = "You have updated your profile!"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_url) unless current_user?(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
