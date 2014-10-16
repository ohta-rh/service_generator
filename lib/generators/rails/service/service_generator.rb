module Rails
  module Generators
    class ServiceGenerator < NamedBase
      source_root File.expand_path('../templates', __FILE__)

      def generate_service_class
        template 'service.rb.erb', File.join('app/services', class_path, "#{file_name}_service.rb")
      end

      def generate_service_spec
        template 'service_spec.rb.erb', "spec/services/#{file_name}_service_spec.rb"
      end
    end
  end
end
