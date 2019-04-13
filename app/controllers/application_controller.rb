class ApplicationController < ActionController::Base

  helper_method :current_user_session, :current_user

  protected

  def only_logged
    redirect_to new_user_session_path if current_user.nil?
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
end
