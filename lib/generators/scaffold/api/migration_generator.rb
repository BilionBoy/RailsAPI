# frozen_string_literal: true

module Scaffold
  module Api
    class MigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("templates", __dir__)

      argument :model_name, type: :string, default: "", banner: "Model name"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_migration_file
        # Corrigindo o nome da classe da migração
        migration_class_name = "Create#{model_name.pluralize.camelize}"

        # Ajustando a criação da migração, passando locals de maneira clara
        migration_template "migration.rb.tt",
                           "db/migrate/#{migration_class_name.underscore}.rb",
                           locals: {
                             model_name: model_name,
                             table_name: model_name.pluralize.underscore,
                             attributes: format_attributes(attributes)
                           }
      end

      # Método auxiliar para formatar os atributos
      def format_attributes(attributes)
        attributes.map do |attr|
          name, type = attr.split(":")
          { name: name, type: type }
        end
      end

      # Ajuste no número da migração
      def self.next_migration_number(dirname)
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
  end
end
