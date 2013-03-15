module Dbpedia
  class Request
    class Params
      ###
      # Read available params from config
      # Initialize param setter methods
      Dbpedia::Config['params'].each do |method_name, param_name|
        define_method "#{method_name}=" do |value|
          @active[param_name] = value
        end
      end

      attr_accessor :active

      def initialize
        @active = {}
      end
    end
  end
end