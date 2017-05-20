# Boombox
[![Gem Version](https://badge.fury.io/rb/lucio-mp3.svg)](https://badge.fury.io/rb/lucio-mp3) [![Test Coverage](https://codeclimate.com/github/RHesketh/cinch-uno/badges/coverage.svg)](https://codeclimate.com/github/RHesketh/lucio-mp3/coverage) [![License Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/UNLICENSE)

An incredibly tiny Shoutcast server that can be embedded into Ruby applications. It has been designed with an emphasis on keeping listeners in synch with each other, so as to maximise the shared experience.

## Installation
First install the gem by running:

```
[sudo] gem install boombox
```

or, even better, by adding it to your `Gemfile`:
```
gem 'boombox' ~> "0.0.1"
```

Now use it in your code:

```ruby
require "boombox"

server = Boombox.new(7777)                # Use port 7777
server.start                             # Start the server
server.play("path_to_mp3_file.mp3")      # Play an MP3 file to all listeners
```

Boombox supports the use of 'waiting' music to play when there's no specific music playing. Boombox 

```ruby
require "boombox"

server = Boombox.new(7777)                # Use port 7777
server.start                             # Start the server
server.play("path_to_mp3_file.mp3")      # Play an MP3 file to all listeners
```

## Documentation
Project documentation can be found [here](#).

## Tests
The plugin has unit and integration tests. To run them:
`rake test`

You may need to `bundle install` first.