# frozen_string_literal: true

require          "rails/generators"
require_relative "scaffold_component_generator"
require_relative "scaffold_config"

module Scaffold
  module Api
    class ScaffoldGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def initialize(*args)
        super
        @config = Scaffold::Api::ScaffoldConfig.new(self)
      end

      def generate_components
        generator = Scaffold::Api::ScaffoldComponentGenerator.new(self, name, @config.attributes, options)
        generator.generate
      end
    end
  end
end
