require_relative 'priority_queue'
require_relative 'url'
require 'test/unit'
 
class TestPriorityQueue < Test::Unit::TestCase
  def setup
    @least_slow_url = Url.new('/least_slow_url')
    @least_slow_url.no_of_requests = 20
    @least_slow_url.total_response_time = 2

    @slowest_url = Url.new('/slowest_url')
    @slowest_url.no_of_requests = 10
    @slowest_url.total_response_time = 2

    @q = PriorityQueue.new(2)
    @q.add @least_slow_url
    @q.add @slowest_url
  end

  def test_add1
    assert_equal(@q.size, 2)
    assert_same(@q.pop, @least_slow_url)
    assert_same(@q.pop, @slowest_url)
  end

  def test_add2
    faster_than_least_slow_url = Url.new('/faster_than_least_slow_url')
    faster_than_least_slow_url.no_of_requests = 30
    faster_than_least_slow_url.total_response_time = 2
    @q.add faster_than_least_slow_url

    assert_equal(@q.size, 2)
    assert_same(@q.pop, @least_slow_url)
    assert_same(@q.pop, @slowest_url)
  end

  def test_add3
    slower_than_least_slow_url = Url.new('/slower_than_least_slow_url')
    slower_than_least_slow_url.no_of_requests = 15
    slower_than_least_slow_url.total_response_time = 2
    @q.add slower_than_least_slow_url

    assert_equal(@q.size, 2)
    assert_equal(@q.minimum_priority, slower_than_least_slow_url.priority)
    assert_same(@q.pop, slower_than_least_slow_url)
    assert_same(@q.pop, @slowest_url)
  end
end
