# frozen_string_literal: true

# Post Controller
class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.id
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: { message: I18n.t('post_deleted') }
  end

  private

  def set_post
    @post = current_user.posts.where(id: params[:id]).first
    return render json: { errors: [I18n.t('post_not_found')] }, status: :not_found if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :body, tags_attributes: %i[name])
  end
end
