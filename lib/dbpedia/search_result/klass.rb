module Dbpedia
  class SearchResult
    class Klass < Dbpedia::Parser

      attr_accessor :label, :uri

      def parse
        self.tap do |obj|
          obj.label = read '> Label'
          obj.uri = read '> URI'
        end
      end

    end
  end
end
