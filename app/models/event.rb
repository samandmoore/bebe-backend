class Event < ApplicationRecord
  belongs_to :kid

  def type_name
    raise NotImplementedError
  end
end
