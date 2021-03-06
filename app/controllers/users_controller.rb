class UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

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
    @photos = @user.photos.paginate(page: params[:page])
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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  def current_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end


end
