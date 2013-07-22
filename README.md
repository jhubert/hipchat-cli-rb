## A Ruby Command Line tool for the HipChat API

Currently provides a simple, easy to use command line tool for sending a message to a HipChat room. Similar to https://github.com/hipchat/hipchat-cli, but about a billion times more Ruby.

### Useage

Install the gem:

    gem install hipchat-cli

Use the bin:

    hipchat_notify --room [Room Name] --token [API TOKEN] Hello World!
    
or 

    echo "Hello World" | hipchat_notify --room [Room Name] --token [API TOKEN]


### Contributing

1. Check master to make sure your idea hasn't already been created
2. Fork the repo
3. Add your changes. Make sure the tests pass (if any)
4. Submit a pull request.

### License

See LICENSE for details
