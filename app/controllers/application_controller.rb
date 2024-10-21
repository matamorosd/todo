class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user

  private

  def current_user
    return unless cookies.signed[:session_id] # Check if the session_id cookie exists

    @current_user ||= begin
      # Find the session by the cookie's session ID
      session = Session.find_by(id: cookies.signed[:session_id])
      session&.user # Return the associated user, if the session is found
    end
  end

  def authenticate_user!
    unless current_user
      redirect_to new_session_url, alert: "You must be logged in to access this section."
    end
  end
end
