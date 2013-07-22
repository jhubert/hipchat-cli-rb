module HipChatCli
  class Application
    def initialize(argv)
      @options = parse_options(argv)

      @message = HipChatCli::Message.new(@options)
    end

    def run
      %w(token room).each do |key|
        raise OptionParser::MissingArgument, "#{key} is a required option" if @options[key.to_sym].nil?
      end


      @message.deliver(@options[:message])
    end

    def help
      @help
    end

    def parse_options(argv)
      options = { color: "yellow", username: "API Client", notify: false }
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

      parser.on("-c","--color COLOR",'message color: "red", "yellow", "green", "purple" or "random" (default "yellow")') do |color|
        if %w(red yellow green purple random).include?(color.downcase)
          options[:room] = color
        else
          options[:room] = "yellow"
        end
      end

      parser.on("-n","--notify","notify the users in the room about the message") do
        options[:notify] = true
      end

      parser.on("-h","--help","help") do
        options[:help] = true
      end

      @help = parser.to_s

      message = parser.parse(argv).first
      options[:message] = message || STDIN.read

      #message = options.delete(:message)

      options
    end
  end
end
