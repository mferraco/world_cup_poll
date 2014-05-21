module AuthenticationHelper
  def signed_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def ensure_signed_in
    # Redirect to the Google Account chooser if they're not logged in
    if !signed_in?
      session[:redirect_to] = request.url
      redirect_to login_path
    end
  end
end