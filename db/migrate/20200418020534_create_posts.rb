# frozen_string_literal: true

# Post Migration
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :author
      t.timestamps
    end
  end
end
