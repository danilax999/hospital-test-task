# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :access_denied

  protected

  def render_error(status)
    render "errors/#{status}", status:
  end
end
