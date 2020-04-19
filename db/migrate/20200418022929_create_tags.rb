# frozen_string_literal: true

# Tags Migration
class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :post, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
