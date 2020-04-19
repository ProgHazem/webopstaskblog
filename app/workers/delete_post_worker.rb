# frozen_string_literal: true

# post Worker
class DeletePostWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    post = Post.find_by_id(id)
    post.destroy
  end
end
