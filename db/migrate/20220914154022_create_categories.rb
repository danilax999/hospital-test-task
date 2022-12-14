# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: false, primary_key: :name do |t|
      t.string :name, null: false

      t.timestamps

      t.index :name, unique: true
    end
  end
end
