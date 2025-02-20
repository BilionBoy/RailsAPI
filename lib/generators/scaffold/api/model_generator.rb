# frozen_string_literal: true

require "rails/generators/named_base"

module Scaffold
  module Api
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_model_file
        template "model.rb.tt", File.join("app/models", "#{file_name}.rb")
      end
    end
  end
end
