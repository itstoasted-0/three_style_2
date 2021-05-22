class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.order(id: :desc)
  end

  def new
  end

  def create
    @post = current_user.posts.create(post_params)
  end

  def edit

  end

  def update
    @post.update!(post_params)
  end

  def destroy
    @post.destroy!
  end

  private

  def post_params
    params.require(:post).permit(:genre, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
