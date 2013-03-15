module Dbpedia
  class Parser
    require 'nokogiri'
    attr_reader :doc

    ###
    # Create a new SearchResult object for each result
    def self.load_many_from(doc, selector='Result')
      return [] if doc.empty?
      doc = Nokogiri::XML(doc.body) unless doc.is_a? Nokogiri::XML::NodeSet
      doc.css(selector).map do |result|
        self.new(result).parse
      end
    end

    def initialize(doc)
      @doc = doc
    end

    def read_xml(attr)
      @doc.css(attr)
    end

    def read(attr)
      read_xml(attr).inner_text
    end

    ##
    # Each SearchResult object shall
    # define it's own parsing method
    def parse
      raise Exception::NoParserMethod
    end
  end
end