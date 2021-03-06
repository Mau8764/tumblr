class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all.order(:created_at, :DESC)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end  

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash.now[:notice] = 'Post deleted'
    redirect_to root_path
  end 

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:tittle, :body)
    end
end
