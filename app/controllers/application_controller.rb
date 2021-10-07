class ApplicationController < ActionController::Base
  before_action :require_login

  # パラメータキー（ユーザコード）
  PARAMSKEY_USER_CODE = "user_code"

  private

  def require_login
    unless logged_in?
      session[:current_user_code] = params[PARAMSKEY_USER_CODE] if Rails.env.development?
      session[:current_user_code] ||= request.headers[:HTTP_USER_CODE]
      @current_user = User.find_by(user_code: session[:current_user_code])
      # ユーザが存在しない場合は消す
      if @current_user.nil?
        session[:current_user_code] = nil
      end
    end
  end

  def logged_in?
    ret = (session[:current_user_code] == params[PARAMSKEY_USER_CODE]) if Rails.env.development?
    ret &&= (session[:current_user_code] == request.headers[:HTTP_USER_CODE])
  end

end
