class Api::Mobile::V1::CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { id: current_user.id, name: current_user.name, email: current_user.email }
  end
end
