require 'capybara-webkit'
require 'mini_magick'

module Photograph
  class Artist
    attr_accessor :url, :options
    attr_reader :image

    def self.browser
      @browser ||= Capybara::Session.new :webkit
    end

    def browser
      self.class.browser
    end

    def initialize url, options={:x => 0, :y => 0, :w => 1024, :h => 768}
      @url, @options = url, options
    end

    def shoot!
      @image = capture
    end

    def capture
      browser.visit @url

      @tempfile_path = Tempfile.new(['photograph','.png'])

      browser.driver.render @tempfile_path.path,
        :width => options[:w],
        :height => options[:h]

      @image = adjust_image
    end

    def adjust_image
      image = MiniMagick::Image.read @tempfile_path
      #      image.crop options[:x].to_s, options[:y].to_s,
      #           options[:w].to_s, options[:h].to_s
      image.write @tempfile_path

      image
    end

    def clean!
      `cat #{@tempfile_path}`
      @tempfile_path.unlink
    end
  end

  Artist.browser
end
