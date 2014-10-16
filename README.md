# ServiceGenerator

ServiceGenerator can generate a class of service

## Install

Add this line to your application's Gemfile:

    gem 'service_generator', github: rawhide/service_generator

And then execute:

    $ bundle

## Usage

    class ExampleService < Service::Base
      attr_accessor :active_flag

      def execute
        something...
      end
    end


    result = ExampleService.new(params).authorized_by(current_user).invoke
    if result.success?
      something...
    else
      something...
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
