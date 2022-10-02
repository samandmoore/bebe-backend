class Api::Mobile::V1::Kids::EventsController < ApplicationController
  def index
    events = current_user.kids.find(params[:kid_id]).events
    result = RailsCursorPagination::Paginator.new(
      events,
      **index_params,
    ).fetch

    render :index, locals: {
      next_cursor: result[:page_info][:end_cursor],
      more: result[:page_info][:has_next_page],
      events: result[:page].map { |e| e[:data] }
    }
  end

  private

  def index_params
    result = {
      order_by: :started_at,
      order: :desc,
    }
    if cursor.present?
      result.merge(after: cursor)
    else
      result
    end
  end

  def cursor
    params.permit(:cursor)[:cursor]
  end
end
