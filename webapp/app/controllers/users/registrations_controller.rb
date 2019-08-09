class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, _params)
    resource.update_without_password(resource_params)
  end

  private

  def resource_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end