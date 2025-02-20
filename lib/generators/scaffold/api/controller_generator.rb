# frozen_string_literal: true

require "rails/generators/named_base"

module Scaffold
  module Api
    class ControllerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_controller_file
        template "controller.rb.tt", File.join("app/controllers", "#{file_name.pluralize}_controller.rb")
      end
    end
  end
end
