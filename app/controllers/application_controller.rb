class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    # ログイン後のリダイレクト先を指定
    def after_sign_in_path_for(resource)
        user_dash_boards_path(resource)
    end

    # パラメータの許可設定
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    end
end
