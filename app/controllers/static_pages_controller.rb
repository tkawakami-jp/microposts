class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
    @user = User.find(current_user) if logged_in?
  end
end
