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

    def search(query)
      url = URI.encode "http://www.urbandictionary.com/define.php?term=#{query}"
      Nokogiri.HTML(open url).at_css('.definition').text.strip
    rescue => e
      e.message
    end

  end
end