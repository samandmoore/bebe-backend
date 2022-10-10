class DiaperEvent < Event
  delegate_missing_to :fields
  attribute :fields, DiaperEvent::FieldsType.new

  validates :diaper_type, inclusion: { in: %w(wet dirty mixed) }
  validates :started_at, inclusion: { in: ->(v) { 100.years.ago..Time.zone.now } }

  def type_name
    :diaper
  end
end
