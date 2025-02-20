require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Apiscope
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2
    # Adiciona a pasta lib/generators ao autoload paths
    config.autoload_paths << Rails.root.join("lib")
    # Verifique se a pasta 'lib/generators' está sendo carregada corretamente
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    config.api_only = true
  end
end
