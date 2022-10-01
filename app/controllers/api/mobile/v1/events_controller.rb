class Api::Mobile::V1::EventsController < ApplicationController
  def destroy
    event = current_user.events.find(params[:id])
    event.destroy!
  end
end
