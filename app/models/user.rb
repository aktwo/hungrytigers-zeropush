require 'zero_push'

class User < ActiveRecord::Base
  def self.notify(message)
    tokens = User.all.map { |e| e.device_token }
    notification = {
      device_tokens: tokens,
      content_available: true,
      info: {message: message}
    }
    ZeroPush.notify(notification)
  end
end
