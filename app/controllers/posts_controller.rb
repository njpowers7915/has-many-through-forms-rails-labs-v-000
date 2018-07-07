class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @comment = @post.comments.build
    @comment.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comment_ids:[],
    comments_attributes: [:content, :user_id], user_ids:[], users_attributes: [:username, :email])
  end
end
