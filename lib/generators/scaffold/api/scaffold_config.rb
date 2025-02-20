# frozen_string_literal: true

module Scaffold
  module Api
    class ScaffoldConfig
      attr_reader :attributes, :options

      def initialize(generator)
        # Definir argumentos
        @attributes = generator.arguments.first || []

        # Definir opções
        @options = generator.options
      end
    end
  end
end
