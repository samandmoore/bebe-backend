class Api::Mobile::V1::UsersController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      head :created
    else
      render json: { errors: resource.errors.details }, status: :unprocessable_entity
    end
  end
end
