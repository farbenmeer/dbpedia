module Dbpedia
  module Exception

    class SparqlLoadError < StandardError
      def message
        """
        You need to to install `sparql-client` in order to use `sparql`.
        In your Gemfile: `gem \"sparql-client\"` and run `$ bundle install`.
        """
      end
    end

    class NoParserMethod < StandardError
      def message
        """
        You should add a `parse` method to each Dbpedia::Parser class.
        """
      end
    end

  end
end