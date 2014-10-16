#
# Base class of service
#
# == Examples
#
#   class ExampleService < Service::Base
#     attr_accessor :active_flag
#
#     def execute
#       something...
#     end
#   end
#
# == Usages
#
#   result = ExampleService.new(params).authorized_by(current_user).invoke
#   if result.success?
#     redirect_to root_url
#   else
#     render :new
#   end
#
class BaseService
  attr_reader :errors, :data

  #
  # == Parameters
  #
  # [params (Hash)] request parameters
  #
  def initialize(params)
    @params = params.dup
  end

  def invoke
    execute
    ServiceResponse.new self
  end

  def authorized_by(user)
    @current_user = user
    self
  end
end
