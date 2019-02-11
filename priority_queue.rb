class PriorityQueue
  MAXIMUM_CAPACITY = 10

  def initialize(capacity = MAXIMUM_CAPACITY)
    @q = []
    @capacity = capacity
  end

  def add(e)
    # not adding if the queue is already full
    # and the adding element has lower priority
    return if full && e.priority < minimum_priority

    # if the queue is already full
    # remove the minimum element first
    pop if full

    @q << e
    bubble_up(last_index)
  end

  def minimum_priority
    return unless not_empty
    @q.first.priority
  end

  def pop
    switch_elements(0, last_index)
    max = @q.pop
    bubble_down(0)
    max
  end

  def full
    @q.size == @capacity
  end

  def not_empty
    @q.any?
  end

  def size
    @q.size
  end

  private

  def bubble_up(index)
    parent_index = index/2
    return if index < 1 || @q[parent_index].priority <= @q[index].priority
    switch_elements(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = index * 2
    return if child_index > last_index

    left_child = @q[child_index]
    right_child = child_index < last_index ? @q[child_index + 1] : nil
    child_index += 1 if right_child && right_child.priority < left_child.priority

    return if @q[index].priority <= @q[child_index].priority

    switch_elements(index, child_index)

    bubble_down(child_index)
  end

  def switch_elements(index1, index2)
    @q[index1], @q[index2] = @q[index2], @q[index1]
  end

  def last_index
    @q.size - 1
  end
end
