class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception #クロスサイトリクエストフォージェリ (CSRF)への対応策のコード

  before_action :configure_permitted_parameters, if: :devise_controller? #configure_permitted_parametersというメソッドは、devise_controllerを使うときしか処理しないということをApplicationコントローラーを読み込む前に判断

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:username])
    end
end
