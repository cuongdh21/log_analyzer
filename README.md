# Log Analyzer

* ruby version: 2.3.1

### Solution:
 - Import all url records from a log file into memory in the form of a hash.
 - Use a `PriorityQueue` class (an implementation of min heap) to prioritize all the urls based on their average response time: only add an url into the queue if its response time is bigger than the minimum response time stored in the queue (reordering is needed after adding a new element).
 - To get the final result, pop (remove min element) from the queue one by one and return in any desirable order.

### Classes:

 - `Url`: To hold an unique record for an url which includes total number of requests and total response time; thus, average response time can be calculated.
 - `PriorityQueue`: To hold 10 urls with slowest response time in a min heap.
 - `LogAnalyzer`: main class to:
 	- read url records from log file to memory
 	- prioritize urls using a PriorityQueue
 	- print out the result in decreasing order

### Complexity Analysis and Scalability:

By using PriorityQueue, no sorting is required but only a given number of urls (10) with slowest response time are stored in the queue at any given time. Adding a new record into the queue requires constanst time complexity, e.g. _O(logk)_ for reprioritize the queue, in which _k = 10_ is the size of the queue. Therefore, overall the solution has the time complexity of _O(n)_, in which _n_ is the number of records stored in the log file. This is asymtotically better than any solution that involves sorting, of which time complexity is _O(nlogn)_

Regarding scalability, it is aware that the solution is ultilizing memory to store log data from file, hence, only suitable for files that are relatively small in size compared to memory size. For much bigger files, memory might not be an ideal solution. Other more capabale data storages such as relational database or even Big Data tools can be considered for such cases.

### Unit test:
`cd` to the source code folder and run:

	ruby test_log_analyzer.rb
	ruby test_priority_queue.rb
	ruby test_url.rb

### Run against custom input:
`cd` to the source code folder and run

	ruby solution.rb <log_file_path>

*Example:*

	ruby solution.rb './fixtures/log6.txt'
