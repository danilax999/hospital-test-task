class ApplicationController < ActionController::Base
  protected
  def render_error(status)
    render "errors/#{status}", status:
  end
end
