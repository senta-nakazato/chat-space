json.array! @messages do |message|
  json.id message.id
  json.name message.user.name
  json.text message.text
  json.image message.image.thumb.url
  json.created_at message.created_at.strftime("%Y-%m-%d %H:%M:%S")
end

