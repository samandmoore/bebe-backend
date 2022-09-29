class Api::Mobile::V1::CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      id: current_user.id,
      name: current_user.name,
      email: current_user.email,
      kids: current_user.kids.map { |k|
        {
          id: k.id,
          name: k.name,
          date_of_birth: k.date_of_birth,
          current: current_user.current_kid_id == k.id,
        }
      },
    }
  end
end
