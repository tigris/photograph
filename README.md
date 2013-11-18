# Photograph

Photograph allows to take screenshots of webpages, the rendering being
done by Chrome.

Typically, this can be used to generate screenshots for DOM based
documents.

Please remind that having a chrome instance doing the rendering, even if it is launched only once,
is slow, around 600ms.

## Installation

Add this line to your application's Gemfile:

    gem 'photograph'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install photograph

## Usage

**Using `Artist.shoot!` without a block had been deprecated in 0.3 and
will raise an exception.**

Photograph can be used either directly through the Photograph::Artist
class or by its little sinatra app. 

    @artist = Photograph::Artist.new(:url => "http://github.com")
    @artist.shoot! do |image|
      image # => MiniMagick instance you can toy with

      send_file image.path,
        :type => :png
    end

Or 

    $ bundle exec photograph -h 127.0.0.1 -p 4567

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Photograph is maintained by Jean-Hadrien Chabran

## License

Photograph is Copyright © 2013 JHCHABRAN. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
