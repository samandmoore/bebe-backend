json.cursor cursor
json.events events do |event|
  json.partial! event, as: :event
end
