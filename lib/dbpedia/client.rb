module Dbpedia
  class Client

    def initialize
      @uris = Dbpedia::Config['uris']
    end

    def find(query, opts={})

    end

    ###
    # Possible keys for _opts_:
    # * *search_method*: Either *keyword_search* (default) or *prefix_search*
    # * *query_class*: A DBpedia class that defines a search scope
    # * *max_hits*: The number of maximum results
    def search(query, opts={})
      search_method = (opts[:method] || :keyword).to_s
      result = request @uris['search'][search_method] do |params|
        params.query_class = opts[:query_class] if opts.has_key?(:query_class)
        params.query_string = query
        params.max_hits = opts[:max_hits] if opts.has_key?(:max_hits)
      end
      Dbpedia::SearchResult.load_many_from(result)
    end

    ###
    # Delegate sparql calls to `sparql-client` gem if available
    def sparql
      return @sparql if @sparql
      begin
        require 'sparql/client'
      rescue LoadError
        raise Exception::SparqlLoadError
      end
      @sparql = SPARQL::Client.new(@uris['sparql'])
    end

    private

    def request(uri, &block)
      Dbpedia::Request.new(uri, &block)
    end
  end
end