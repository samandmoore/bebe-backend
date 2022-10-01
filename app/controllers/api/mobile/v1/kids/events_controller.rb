class Api::Mobile::V1::Kids::EventsController < ApplicationController
  def index
    # TODO: paginate with cursor...
    events = current_user.kids.find(params[:kid_id]).events.order(started_at: :desc)
    render :index, locals: { cursor: nil, events: events }
  end
end
