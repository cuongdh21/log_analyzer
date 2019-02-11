require_relative 'log_analyzer'
require 'test/unit'

class TestLogAnalyzer < Test::Unit::TestCase
  def test_analyze_requests1
    analyzer = LogAnalyzer.new './fixtures/log1.txt'
    results = analyzer.analyze_requests
    assert_equal(results, ['/articles.html?id=4', '/vendor/bootstrap.min.js'])
  end

  def test_analyze_requests2
    analyzer = LogAnalyzer.new './fixtures/log2.txt'
    results = analyzer.analyze_requests
    assert_equal(results, ['/articles.html?id=4'])
  end

  def test_analyze_requests3
    analyzer = LogAnalyzer.new './fixtures/log3.txt'
    results = analyzer.analyze_requests
    assert_equal(results, ['/articles.html?id=4'])
  end

  def test_analyze_requests4
    analyzer = LogAnalyzer.new './fixtures/log4.txt'
    results = analyzer.analyze_requests
    assert_equal(results, ['/articles.html?id=4'])
  end

  def test_analyze_requests5
    analyzer = LogAnalyzer.new './fixtures/log5.txt'
    results = analyzer.analyze_requests
    assert_equal(results, ['/articles.html?id=5', '/vendor/bootstrap.min.js', '/articles.html?id=4'])
  end

  def test_analyze_requests6
    analyzer = LogAnalyzer.new './fixtures/log6.txt'
    results = analyzer.analyze_requests
    expected_results = ['/articles.html?id=8', '/articles.html?id=7', '/articles.html?id=6', '/articles.html?id=5',
                        '/articles.html?id=4', '/articles.html?id=12', '/articles.html?id=11',
                        '/articles.html?id=10', '/articles.html?id=3', '/articles.html?id=9']

    assert_equal(results, expected_results)
  end

  def test_analyze_requests7
    analyzer = LogAnalyzer.new './fixtures/empty.txt'
    results = analyzer.analyze_requests
    assert_equal(results, [])
  end
end
