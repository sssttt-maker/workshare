class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message) # modelから呼ばれる
    # ActionCable.server.broadcast "user_message_channel", message: message # 最初に作ったもの
    ActionCable.server.broadcast "user_message_channel", message: message
  end
end
