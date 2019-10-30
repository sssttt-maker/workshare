class UserMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(
      user_id: data['user_id'],
      content: data['message']
    )
  end
end
