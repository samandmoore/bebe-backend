class Api::Mobile::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def respond_with(resource, _opts = {})
    render status: :created
  end

  def respond_to_on_destroy
    if current_user
      head :ok
    else
      head :unauthorized
    end
  end
end
