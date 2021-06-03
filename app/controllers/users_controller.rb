class UsersController < ApplicationController
  before_action :set_user, only: %i[show following followers]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @posts = current_user.posts
    #findメソッドだと投稿がないとnillを返してしまう
    @post = Post.find_by(params[:id])
  end

  def following
    #@userがフォローしているユーザー
    @users = @user.following
    render "show_follow"
  end

  def followers
    #@userをフォローしているユーザー
    @users = @user.followers
    render "show_follower"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
