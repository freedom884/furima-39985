class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def create

    @user = User.new(user_params)
    if @user.save
      session.delete(:user_data)
      redirect_to root_path, notice: 'ユーザーが登録されました。'
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      session[:user_data] = @user.attributes
      render :new # もしくは適切なビューにリダイレクトするなど
    end
  end
 

  private
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email, :password, :password_confirmation, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day])
  end


end
