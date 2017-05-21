# Boombox
[![Gem Version](https://badge.fury.io/rb/boombox.svg)](https://badge.fury.io/rb/boombox) [![Test Coverage](https://codeclimate.com/github/RHesketh/boombox/badges/coverage.svg)](https://codeclimate.com/github/RHesketh/boombox/coverage) [![License Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/UNLICENSE)

An incredibly tiny Shoutcast server that can be embedded into Ruby applications. It has been designed with an emphasis on keeping listeners in synch with each other, so as to maximise the shared experience.

## Installation
First install the gem by running:

```
[sudo] gem install boombox
```

or, even better, by adding it to your `Gemfile`:
```
gem 'boombox' ~> "0.0.3"
```

Now use it in your code:

```ruby
require "boombox"

server = Boombox.new(7777)                        # Use port 7777
server.start                                      # Start the server
server.play("path_to_mp3_file.mp3")               # Play an MP3 file to all listeners
server.play("mp3_file_folder/", loop: true)       # Play all MP3 files in a folder, looping continuously
server.play("mp3_file_folder/", shuffle: true)    # Play all MP3 files in a folder in a random order
```

## Documentation
Project documentation can be found [here](#).

## Tests
The plugin has unit and integration tests. To run them:
`rake test`

You may need to `bundle install` first.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RHesketh/boombox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
