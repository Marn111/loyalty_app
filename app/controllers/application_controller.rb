class ApplicationController < ActionController::API
  protect_from_forgery with: :exception unless Rails.application.config.action_controller.default_protect_from_forgery

  def render_errors(errors, status = :unprocessable_entity)
    errors = [errors] unless errors.is_a? Array
    render json: {errors: errors}, status: status
  end
end
