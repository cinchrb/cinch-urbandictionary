require 'cinch'
require 'cgi'
require 'json'
require 'open-uri'

module Cinch::Plugins
  class UrbanDictionary
    include Cinch::Plugin

    match(/urban (.*)/)
    def execute(m, query)
      m.reply search(query)
    end

    private
    def search(query)
      uri = "http://api.urbandictionary.com/v0/define?term=%s" % [CGI.escape(query)]
      open(uri) do |f|
        JSON.parse(f.read)['list'][0]['definition'].gsub(/(\r\n)+/, ' ')
      end
    rescue => e
      exception(e)
      "An exception occured"
    end
  end
end
