json.id         @message.id
json.text       @message.text
json.name       @message.user.name
json.image      @message.image.thumb.url
json.created_at @message.created_at.strftime("%Y-%m-%d %H:%M:%S")

