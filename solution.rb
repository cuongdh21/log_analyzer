require_relative 'log_analyzer'

file_path = ARGV[0]
analyzer = LogAnalyzer.new file_path
results = analyzer.analyze_requests
p results
