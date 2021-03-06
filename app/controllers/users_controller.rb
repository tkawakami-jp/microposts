class UsersController < ApplicationController
  
  #ログイン？？？
  before_action :logged_in_user, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    if current_user != User.find(params[:id])
      redirect_to user_path(current_user)
    end
  end
  
  def update
    if @user.update(profile_params)
      flash[:success] = "プロフィールを編集しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @user = User.find(params[:id])
  end
  
  def followers
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def profile_params
    params.require(:user).permit(:name, :email, :description, :location)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
