class Api::Mobile::V1::UsersController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { id: resource.id, name: resource.name, email: resource.email }, status: :ok
    else
      render json: { errors: resource.errors.details }, status: :unprocessable_entity
    end
  end
end
