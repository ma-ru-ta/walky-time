class Admin::PostsController < ApplicationController
before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page]).per(20)
    @prefectures = Prefecture.all
    if params[:prefecture]
      @posts = Post.where(prefecture_id: params[:prefecture]).page(params[:page]).per(20)
    else
      @posts = Post.page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.find(params[:id])
    # @post_comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:dog_name, :dog_type, :dog_sex, :day, :prefecture_id, :city, :post_body, :post_image)
  end

end
