require 'dbpedia/parser'

module Dbpedia
  class SearchResult < Dbpedia::Parser
    require 'dbpedia/search_result/category'
    require 'dbpedia/search_result/klass'

    attr_accessor :refcount, :label, :uri, :description, :label, :categories, :classes

    def parse
      self.tap do |obj|
        obj.label = read '> RefCount'
        obj.label = read '> Label'
        obj.uri = read '> URI'
        obj.description = read '> Description'
        obj.categories = Category.load_many_from(read_xml('> Categories'), 'Category')
        obj.classes = Klass.load_many_from(read_xml('> Classes'), 'Class')
      end
    end

  end
end