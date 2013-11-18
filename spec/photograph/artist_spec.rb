require 'spec_helper'

module Photograph
  describe Artist do
    URL = "http://rubygems.org"

    it "should instanciate a new artist" do
      Artist.new :url => URL
    end

    it "should accept a block when shooting" do
      Artist.new(:url => URL).shoot! do |image|
        image.should respond_to(:path)
      end
    end

    it "should raise an exception if not block was given when shooting" do
      expect {Artist.new(:url => URL).shoot!}.to raise_error
    end

    it "should raise an error without an url" do
      expect { Artist.new }.to raise_error(Artist::MissingUrlError)
    end

    describe "Wrongly formed urls" do
      it "should leave '#{URL} untouched as it is already valid" do
        @artist = Artist.new :url => URL

        expect(@artist.options[:url]).to eq(URL)
      end

      it "should leave 'https://rubygems.org' untouched as it is already valid" do
        @artist = Artist.new :url => 'https://rubygems.org'

        expect(@artist.options[:url]).to eq('https://rubygems.org')
      end

      it "should prepend 'http://' if protocol isn't present" do
        @artist = Artist.new :url => "github.com"

        expect(@artist.options[:url]).to eq("http://github.com")
      end
    end

    describe "Default size values" do
      before(:each) { @artist = Artist.new :url => URL }

      it "should have default values for x,y : 0,0" do
        @artist.options[:x].should == 0
        @artist.options[:y].should == 0
      end

      it"should have default values for h,w : 1280, 1024" do
        @artist.options[:w].should == 1280
        @artist.options[:h].should == 1024
      end
    end

    describe "Cropping" do
      before(:each) { @artist = Artist.new :url => URL }

      it "should take a screenshot large enough to crop later" do
        pending

        @artist = Artist.new :url => URL, :x => 200, :y => 100, :h => 400, :w => 400

        Artist.browser.driver.stub :render

        @artist.shoot!
      end
    end
  end
end
