require_relative 'url'
require 'test/unit'
 
class TestUrl < Test::Unit::TestCase
  def setup
    @url = Url.new('url')
  end

  def test_average_response_time1
    assert_equal(@url.no_of_requests, 0)
    assert_same(@url.average_response_time, nil)
  end

  def test_average_response_time2
    @url.no_of_requests = 100
    @url.total_response_time = 12

    assert_equal(@url.average_response_time, 0.12)
  end

  def test_priority
    @url.no_of_requests = 1000
    @url.total_response_time = 50

    assert_equal(@url.priority, 0.05)
  end
end
