class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception

  helper_method :logged_in?


  def after_sign_in_path_for(resource)
     user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end



  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
    #サインイン時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
