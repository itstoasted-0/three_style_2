class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @posts = current_user.posts
    @post = Post.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
