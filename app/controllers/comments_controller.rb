# frozen_string_literal: true

# comments Controller
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy]
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: I18n.t('comment_deleted') }

  end

  private
  def set_comment
    @comment = current_user.comments.where(id: params[:id], post_id: params[:post_id]).first
    return render json: { errors: [I18n.t('comment_not_found')] }, status: :not_found if @comment.nil?
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
