# frozen_string_literal: true

class AddUserName < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
  end
end
