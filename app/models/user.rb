require 'zero_push'

class User < ActiveRecord::Base
  def self.notify
    tokens = User.all.map { |e| e.device_token }
    notification = {
      device_tokens: [tokens],
      content_available: true
    }
    ZeroPush.notify(notification)
  end
end
