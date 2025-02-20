# frozen_string_literal: true

require "rails/generators"
require_relative "scaffold_component_generator"

module Scaffold
  module Api
    class ScaffoldGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      # Argumento para atributos de campo
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      # Opção para escolher qual parte do scaffold gerar
      class_option :only, type: :string, default: nil, desc: "Escolha apenas uma parte: model, migration, controller"

      # Método principal que decide o que gerar
      def generate_components
        generator = Scaffold::Api::ScaffoldComponentGenerator.new(self, name, attributes, options)
        generator.generate
      end
    end
  end
end
