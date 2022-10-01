class DiaperEvent::Fields
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :diaper_type, :string
end
