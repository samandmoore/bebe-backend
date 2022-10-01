class DiaperEvent < Event
  delegate_missing_to :fields
  attribute :fields, DiaperEvent::FieldsType.new

  validates :diaper_type, inclusion: { in: %w(wet dirty mixed) }

  def type_name
    :diaper
  end
end
