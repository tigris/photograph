require 'spec_helper'

module Photograph
  describe Artist do
    let(:url) { 'http://rubygems.org' }

    subject { Artist.new :url => url }

    it { expect(subject).to be_kind_of(Artist) }

    it('should accept a block when shooting') do
      subject.shoot!{|image| image.should respond_to(:path) }
    end

    it('should raise an exception if no block was given when shooting') do
      expect{ subject.shoot! }.to raise_error(Artist::DeprecationError)
    end

    it('should raise an error without an url') do
      expect{ Artist.new }.to raise_error(Artist::MissingUrlError)
    end

    describe "Wrongly formed urls" do
      it('should leave http version of url untouched as it is already valid') do
        expect(subject.options[:url]).to eq(url)
      end

      it('should leave https version of url untouched as it is already valid') do
        expect(Artist.new(:url => 'https://rubygems.org').options[:url]).to eq('https://rubygems.org')
      end

      it('should prepend http:// if protocol is not present') do
        expect(Artist.new(:url => 'github.com').options[:url]).to eq('http://github.com')
      end
    end

    describe 'Default size values' do
      it('should have default value for x') { expect(subject.options[:x]).to eq(0) }
      it('should have default value for y') { expect(subject.options[:y]).to eq(0) }
      it('should have default value for w') { expect(subject.options[:w]).to eq(1280) }
      it('should have default value for h') { expect(subject.options[:h]).to eq(1024) }
    end

    describe 'Cropping' do
      subject { Artist.new :url => URL, :x => 200, :y => 100, :h => 400, :w => 400 }
      before { Artist.browser.driver.stub(:render) }

      xit 'should take a screenshot large enough to crop later' do
        subject.shoot!
      end
    end

  end
end
