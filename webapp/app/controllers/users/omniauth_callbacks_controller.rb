class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def failure
    redirect_to root_path, alert: 'Something went wrong.'
  end
end