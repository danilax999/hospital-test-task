# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :phone, :role, :name, :created_at, :updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:phone, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # form do |f|
  #   f.semantic_errors
  #   f.inputs do
  #     f.input :name
  #     f.input :phone
  #     f.input :role
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end
end
