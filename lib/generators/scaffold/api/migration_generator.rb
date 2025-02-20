# frozen_string_literal: true

require "rails/generators"
require "rails/generators/migration"

module Scaffold
  module Api
    class MigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("templates", __dir__)

      argument :model_name, type: :string, default: "", banner: "Model name"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_migration_file
        # Define o nome do arquivo de migração com o plural do nome do modelo
        migration_template "migration.rb.tt", "db/migrate/#{migration_file_name}.rb"
      end

      # Ajuste no número da migração
      def self.next_migration_number(dirname)
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
  end
end
