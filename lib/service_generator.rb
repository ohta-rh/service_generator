require 'service_generator/service_response'
require 'service_generator/base_service'

module ServiceGenerator
  class Railtie < Rails::Railtie
    generators do
      require "generators/rails/service/service_generator"
    end
  end
end
