module HipChatCli
  class Application
    def initialize(argv)
      @options, @msg = parse_options(argv)
    end

    def run
      HipChatCli::Message.new(@options).deliver(@msg)
    end

    def help
      @help
    end

    def parse_options(argv)
      options = {
        color: "yellow",
        notify: false,
        username: ENV['HIPCHAT_API_USERNAME'] || "API Client",
        room: ENV['HIPCHAT_API_ROOM'] || nil,
        token: ENV['HIPCHAT_API_TOKEN'] || nil
      }

      parser = OptionParser.new
      parser.banner = "Usage: hipchat_notify [OPTIONS] message"
      parser.separator  ""
      parser.separator  "Options"

      parser.on("-t","--token API_TOKEN","[required] The API token for HipChat") do |token|
        options[:token] = token
      end

      parser.on("-r","--room ROOM","[required] The room ID to receive the message") do |room|
        options[:room] = room
      end

      parser.on("-u","--user USERNAME","The name of the sender. Default: API Client") do |username|
        options[:username] = username
      end

      parser.on("-f","--format FORMAT","The format of the message. Default: html") do |format|
        options[:format] = format
      end

      parser.on("-c","--color COLOR",'message color: "red", "yellow", "green", "purple", "gray" or "random" (default "yellow")') do |color|
        options[:color] = color if %w(red yellow green purple gray random).include?(color.downcase)
      end

      parser.on("-n","--notify","notify the users in the room about the message") do
        options[:notify] = true
      end

      parser.on("-h","--help","help") do
        puts parser.to_s
        exit 0
      end

      @help = parser.to_s

      message = parser.parse(argv).join(' ')
      message = STDIN.read if message.nil? || message == ""

      [options, message]
    end
  end
end
