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
        obj = JSON.parse(f.read)
        if obj['list'].empty?
          "No result"
        else
          obj['list'][0]['definition'].gsub(/(\r\n)+/, ' ')
        end
      end
    rescue => e
      exception(e)
      "An exception occured"
    end
  end
end
