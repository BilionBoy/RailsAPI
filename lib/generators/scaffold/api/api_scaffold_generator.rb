# frozen_string_literal: true

require "rails/generators"

module Scaffold
  module Api
    class ScaffoldGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)       # Corrigindo o caminho do source_root

      argument :attributes, type: :array, default: [], banner: "field:type field:type"
      
      class_option :only, type: :string, default: nil, desc: "Escolha apenas uma parte: model, migration, controller"

      def generate_components
        case options[:only]
        when "model"
          invoke "scaffold:api:model",      [name] + attributes
        when "migration"
          invoke "scaffold:api:migration",  [name] + attributes
        when "controller"
          invoke "scaffold:api:controller", [name] + attributes
        else
          invoke "scaffold:api:model",      [name] + attributes
          invoke "scaffold:api:migration",  [name] + attributes
          invoke "scaffold:api:controller", [name] + attributes
        end
      end
    end
  end
end
