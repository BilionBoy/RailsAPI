require_relative "boot"
require "rails/all"

# Requer as gems listadas no Gemfile, incluindo quaisquer gems
# limitadas aos ambientes :test, :development ou :production.
Bundler.require(*Rails.groups)

module Apiscope
  class Application < Rails::Application
    # Inicializa as configurações padrão para a versão original do Rails gerada.
    config.load_defaults 7.2

    # Configuração para autoload de arquivos dentro da pasta 'lib'
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)

    # Caso necessário, adicione subdiretórios específicos de 'lib' para serem ignorados
    # em processos de autoload e eager load.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuração para a aplicação ser apenas uma API (sem views, por exemplo)
    config.api_only = true
  end
end
