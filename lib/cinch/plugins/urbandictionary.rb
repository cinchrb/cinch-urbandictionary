require 'cinch'
require 'open-uri'
require 'nokogiri'

module Cinch::Plugins
  class UrbanDictionary
    include Cinch::Plugin

    match /urban (.*)/

    def execute(m, query)
      m.reply search(query)
    end

    private
      def search(query)
        url = URI.encode "http://www.urbandictionary.com/define.php?term=#{query}"
        Nokogiri.HTML(open url).at_css('.meaning').text.gsub!(/\r/, ' ').strip
      rescue => e
        e.message
      end

  end
end
