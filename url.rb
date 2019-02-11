class Url
  attr_accessor :no_of_requests, :total_response_time
  attr_reader :path

  def initialize(path)
    @path = path
    @no_of_requests = 0
  end

  def average_response_time
    return unless no_of_requests > 0
    (total_response_time.to_f / no_of_requests).to_f
  end

  def priority
    average_response_time
  end
end
