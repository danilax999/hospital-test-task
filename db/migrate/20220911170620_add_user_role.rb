# frozen_string_literal: true

class AddUserRole < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, null: false, default: 1
  end
end
