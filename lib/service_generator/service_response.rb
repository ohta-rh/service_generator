#
# Class of response generation
#
class ServiceResponse
  attr_accessor :data

  def initialize(service)
    @service = service
  end

  def errors
    @errors ||= @service.errors
  end

  def data
    @data ||= @service.data
  end

  def success?
    errors.blank?
  end
end
