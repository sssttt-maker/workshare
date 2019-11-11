class UserMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    @message = Message.new(
      user_id: data['user_id'],
      content: data['message'],
      room_id: data['room_id'],
      image: data['image']
    )

   if @message.save(validate: false)
     @message.parse_base64(data['image'])
   end
  end
end
