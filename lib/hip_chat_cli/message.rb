require 'hipchat'

module HipChatCli
  class Message
    def initialize(params)
      @room     = params[:room]
      @notify   = params[:notify]   || false
      @format   = params[:format]   || 'html'
      @color    = params[:color]    || 'yellow'
      @username = params[:username] || 'API'

      @client = HipChat::Client.new(params[:token])
    end

    def deliver(message)
      @client[@room].send(@username, message, {
          :notify => @notify,
          :message_format => @format,
          :color => @color
        }
      )
    end
  end
end
