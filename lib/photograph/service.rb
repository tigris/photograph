require 'sinatra/base'
require 'sinatra/json'

module Photograph
  # Preload the chrome instance
  Artist.browser

  class Service < ::Sinatra::Base
    helpers Sinatra::JSON

    get '/' do
      json :version => Photograph::VERSION
    end

    get '/shoot' do
      artist = Artist.new :url => params["url"],
                          :x   => params["x"].to_i,
                          :y   => params["y"].to_i,
                          :w   => params["w"].to_i,
                          :h   => params["h"].to_i,
                          :wait => params["wait"].to_f,
                          :selector => params["selector"]

      artist.shoot! do |image|
        send_file image.path,
          :type => :png
      end
    end
  end
end

