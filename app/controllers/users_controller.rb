class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @posts = current_user.posts
  end

end
