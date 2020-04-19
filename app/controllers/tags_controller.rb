# frozen_string_literal: true

# Post Controller
class TagsController < ApplicationController
  before_action :set_tag, only: %i[update]
  before_action :authenticate_user!

  def update
    if @tag.update(tag_params)
      render json: { messge: I18n.t('updated_success'), data: @tag }
    else
      render json: {errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
	def set_tag
		@post = current_user.posts.where(id: params[:post_id]).first
		@tag =  @post.tags.where(id: params[:id]).first
		return render json: { errors: [I18n.t('tag_not_found')] }, status: :not_found if @tag.nil?
	end

	def tag_params
    params.require(:tag).permit(:name, :post_id)
	end
end
