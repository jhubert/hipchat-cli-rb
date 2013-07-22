## A Ruby Command Line tool for the HipChat API

Currently provides a simple, easy to use command line tool for sending a message to a HipChat room. Similar to https://github.com/hipchat/hipchat-cli, but about a billion times more Ruby.

### Installation

Install the gem:

    gem install hipchat-cli

### Sending A Message

Use the bin:

    hipchat_notify --room [Room Name] --token [API TOKEN] Hello World!
    
or 

    echo "Hello World" | hipchat_notify --room [Room Name] --token [API TOKEN]

#### Options

    -t, --token API_TOKEN            [required] The API token for HipChat
    -r, --room ROOM                  [required] The room ID to receive the message
    -u, --user USERNAME              The name of the sender. Default: API Client
    -f, --format FORMAT              The format of the message. Default: html
    -c, --color COLOR                message color: "red", "yellow", "green", "purple" or "random" (default "yellow")
    -n, --notify                     notify the users in the room about the message
    -h, --help                       Show the options and sample usage

### More CLI bins please!

It would be awesome to have more commands added to this tool, either as a command or as a standalone bin. If you want to add one, please follow the contribution guidelines below.

Some ideas:

* create a room
* update a topic
* create a user
* delete a user

.. pretty much anything [the HipChat API](https://www.hipchat.com/docs/api/) supports. :+1:

### Contributing

1. Check master to make sure your idea hasn't already been created
2. Fork the repo
3. Add your changes. Make sure the tests pass (if any)
4. Submit a pull request.

### License

See LICENSE for details
