require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Apiscope
  class Application < Rails::Application
    config.load_defaults 7.2

    config.time_zone = "La Paz"           # Configuração do Time Zone
    config.i18n.default_locale = :'pt-BR' # Configuração do idioma padrão

    # Configuração para autoload de arquivos dentro da pasta 'lib'
    config.autoload_paths +=   %W[#{config.root}/lib]
    config.eager_load_paths += %W[#{config.root}/lib]

    # Caso necessário, adicione subdiretórios específicos de 'lib' para serem ignorados
    # em processos de autoload e eager load.
    config.autoload_lib(ignore: %w[assets tasks])

    config.api_only = true
  end
end
