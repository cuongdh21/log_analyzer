require_relative 'priority_queue'
require_relative 'url'

class LogAnalyzer
  def initialize(file_path)
    raise ArgumentError.new("Invalid file path '#{file_path}'") unless file_path && File.file?(file_path)

    # input log file
    @file_path = file_path

    # to hold all urls from log file
    @requests_hash = {}

    # to hold top (10) urls with
    # largest average processing time
    @priority_queue = PriorityQueue.new
  end

  def analyze_requests
    import_requests
    rank_urls
    output
  end

  private

  # load urls from file to @requests_hash
  def import_requests
    File.foreach(@file_path) do |record|
      url_arr = record.split(', ')
      path = url_arr[0].downcase
      status_code = url_arr.last

      next if !status_code.include?('200') || path.end_with?('.gif')

      response_time = url_arr[1].tr('s', '').to_f

      record = @requests_hash[path] || Url.new(path)
      record.no_of_requests += 1
      record.total_response_time ||= 0
      record.total_response_time += response_time

      @requests_hash[path] = record
    end
  end

  # load top 10 urls from @requests_hash
  # to @priority_queue
  def rank_urls
    @requests_hash.each do |_path, request|
      @priority_queue.add(request)
    end
  end

  # output results from @priority_queue
  def output
    results = []
    while @priority_queue.not_empty
      results.unshift @priority_queue.pop
    end

    results.map(&:path)
  end
end
