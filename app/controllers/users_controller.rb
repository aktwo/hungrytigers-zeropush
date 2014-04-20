require 'zero_push'

class UsersController < ApplicationController

  def create
    # User.create(user_params)
    # ZeroPush expects a hash as a notification
    notification = {
      device_tokens: ["55fabe83690cee527888ef7e76fa9783c3c998b1552937e6b536544ec043759e"],
      content_available: true,
      info: '{"name": "BLAH", "email": "BLAH", "subject": "BLAH", "content": "BLAH", "long" : "SDLKFJSLDKFJSLDKFJ", "lat": "LKSDJFLSKDJFLKSJ", "timestamp": "LSKDJFLSDKJFLSDKJFLDKSJFLKDSJFLKSDJFLKSDJFLKSDJLFKJSDLFKJSDLKFJLSDKFJLSKDJFLSDKJFLKSDJFLSKDJFLSKDJFLSKDJFLDSKJFLSKDJF"}'
    }
    # Send the notification
    ZeroPush.notify(notification) # => true
  end

  # private

  # def listing_params
  #   params.require(:user).permit(:device_token)
  # end
end
