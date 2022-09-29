class Api::Mobile::V1::CurrentKidController < ApplicationController
  def update
    current_kid = current_user.kids.find(params[:current_kid_id])
    current_user.update!(current_kid: current_kid)
  end

  private

  def update_params
    params.permit(:current_kid_id)
  end
end
