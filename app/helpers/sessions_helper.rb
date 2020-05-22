module SessionsHelper

  # Log in a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns currently logged in user, if any
  def current_user
    if session[:user_id]
    # @current_user.nil? ? User.find_by(...) : @current_user
    # @current_user = @current_user || User.find_by(...)
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if user logged in
  def logged_in
    !current_user.nil?
  end
end
