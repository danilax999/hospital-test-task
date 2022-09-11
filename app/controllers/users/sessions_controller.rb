# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   logger.info "Create params: #{params}"
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    # params[:user][:phone] = params[:user][:phone]&.chars&.filter { |c| '0' <= c && c <= '9' }&.join
    devise_parameter_sanitizer.permit :sign_in, keys: %i[phone]
  end
end
