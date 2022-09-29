class Api::Mobile::V1::KidsController < ApplicationController
  def create
    kid = current_user.kids.build(create_params)
    kid.save!
  end

  def update
    kid = current_user.kids.find(params[:id])
    kid.update!(update_params)
  end

  def destroy
    kid = current_user.kids.find(params[:id])
    kid.destroy!
  end

  private

  def create_params
    params.require(:kid).permit(:name, :date_of_birth)
  end

  def update_params
    params.require(:kid).permit(:name, :date_of_birth)
  end
end
