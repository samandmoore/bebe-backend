class DiaperEvent::FieldsType < ActiveModel::Type::Value
  def type
    :jsonb
  end

  def cast_value(value)
    case value
    when String
      decoded = ActiveSupport::JSON.decode(value) rescue nil
      DiaperEvent::Fields.new(decoded) unless decoded.nil?
    when Hash
      DiaperEvent::Fields.new(value)
    when AutoBuyerRules
      value
    end
  end

  def serialize(value)
    case value
    when Hash, DiaperEvent::Fields
      ActiveSupport::JSON.encode(value)
    else
      super
    end
  end

  def changed_in_place?(raw_old_value, new_value)
    cast_value(raw_old_value) != new_value
  end
end
