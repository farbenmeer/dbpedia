require 'dbpedia/request/params'

module Dbpedia
  class Request
    require 'uri'
    require 'open-uri'

    attr_accessor :params, :uri, :body

    def initialize(uri)
      @params = Params.new and (yield(@params, uri) if block_given?)
      @uri = URI.parse(uri)
      @uri.query = URI.encode_www_form(@params.active)
      @uri.tap { |uri| @body = uri.open.read }
    end

    def empty?
      body.empty?
    end

  end
end