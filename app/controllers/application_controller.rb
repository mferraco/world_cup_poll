class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include GoogleHelper
  include AuthenticationHelper

  CLIENT_ID = '717152703804-4ib7ab7f0sbk4phr6n4o6lv498ik2p9d.apps.googleusercontent.com'
  CLIENT_SECRET = '3lqre3rUSkytZXE0zlkLcvMD'

  CLIENT_SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email'

  BASEURL = APP_CONFIG['server_name']
end
