module Scaffold
  module Api
    class ScaffoldComponentGenerator
      def initialize(generator, name, attributes, options)
        @generator = generator
        @name = name
        @attributes = attributes
        @options = options
      end

      def generate
        case scaffold_component
        when "model"
          generate_model
        when "controller"
          generate_controller
        when "migration"
          generate_migration
        else
          generate_all_components
        end
      end

      private

      def scaffold_component
        @options[:only].to_s.strip.downcase.presence || "all"
      end

      def generate_model
        @generator.invoke "scaffold:api:model", [ @name ] + @attributes
      end

      def generate_controller
        @generator.invoke "scaffold:api:controller", [ @name ] + @attributes
      end

      def generate_migration
        @generator.invoke "scaffold:api:migration", [ @name ]
      end

      def generate_all_components
        generate_model
        generate_controller
        generate_migration
      end
    end
  end
end
