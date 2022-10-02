json.next_cursor next_cursor
json.more more
json.events events do |event|
  json.partial! event, as: :event
end
