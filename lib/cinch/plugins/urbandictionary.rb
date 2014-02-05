require 'cinch'
require 'httparty'

module Cinch::Plugins
  class UrbanDictionary
    include Cinch::Plugin
    include HTTParty
    format :json
    base_uri "http://api.urbandictionary.com/"
    match /urban (.*)/

    def execute(m, query)
      m.reply search(query)
    end

    private
    def search(query)
      response = self.class.get '/v0/define', query: { term: query }
      response['list'][0]['definition'].gsub(/\r\n/, ' ')
    rescue => e
      e.message
    end
  end
end
