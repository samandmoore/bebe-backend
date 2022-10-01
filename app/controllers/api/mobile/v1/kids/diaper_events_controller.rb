class Api::Mobile::V1::Kids::DiaperEventsController < ApplicationController
  def create
    kid = current_user.kids.find(params[:kid_id])
    event = kid.diaper_events.build(create_params)
    if event.save
      head :no_content
    else
      render json: { errors: event.errors.details }, status: :unprocessable_entity
    end
  end

  def update
    kid = current_user.kids.find(params[:kid_id])
    event = kid.diaper_events.find(params[:id])
    if event.update(update_params)
      head :no_content
    else
      render json: { errors: event.errors.details }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:diaper_event).permit(:diaper_type, :started_at)
  end

  def update_params
    params.require(:diaper_event).permit(:diaper_type, :started_at)
  end
end
