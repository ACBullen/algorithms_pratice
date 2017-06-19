# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?
# we can maintain a reference to the max at any point by iterating over our
# store every time we dequeue. For n enqueue/dequeues this would be O(n^2)
#
# we can do better. our target time complexity for #max will be O(1) by
# spending O(n) amortized for n enqueue/dequeue operations.
# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @enqueue = RingBuffer.new()
    @dequeue = RingBuffer.new()
  end

  def enqueue(val)
    if @enqueue.length == 0
      @enqueue.push([val, val])
    else
      if @enqueue[@enqueue.length - 1][1] < val
        @enqueue.push([val, val])
      else
        @enqueue.push([val, @enqueue[@enqueue.length - 1][1]])
      end
    end
  end

  def dequeue
    if @dequeue.length == 0
      until @enqueue.length == 0
        pushee = @enqueue.pop
        if @dequeue.length == 0 || pushee[1] > @dequeue[@dequeue.length - 1][1]
          pushee[1] = pushee[0]
          @dequeue.push(pushee)
        else
          pushee[1] = @dequeue[@dequeue.length - 1][1]
          @dequeue.push(pushee)
        end
      end
      @dequeue.pop
    else
      @dequeue.pop
    end
  end

  def max

    return @enqueue[@enqueue.length - 1][1] if @enqueue.length > 0 && @dequeue.length == 0
    return @dequeue[@dequeue.length - 1][1] if @enqueue.length == 0 && @dequeue.length > 0
    if @enqueue[@enqueue.length - 1][1] > @dequeue[@enqueue.length - 1][1]
      @enqueue[@enqueue.length - 1][1]
    else
      @dequeue[@dequeue.length - 1][1]
    end
  end

  def length
    @enqueue.length + @dequeue.length
  end

end
