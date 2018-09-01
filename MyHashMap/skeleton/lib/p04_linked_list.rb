
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    current_node = first
    
    until current_node.next == nil
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    return true unless get(key) == nil
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    old_node = @tail.prev
    
    @tail.prev = new_node

    new_node.next = @tail
    new_node.prev = old_node
    
    old_node.next = new_node
  end

  def update(key, val)
    current_node = first
    
    until current_node.next == nil
      if current_node.key == key
        current_node.val = val 
        break
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = first
    
    until current_node.next == nil
      if current_node.key == key
        next_node = current_node.next
        prev_node = current_node.prev
        
        next_node.prev = prev_node
        prev_node.next = next_node
      end
      current_node = current_node.next
    end
    nil
  end

  def each(&prc)
    result = []
    
    current_node = first
    until current_node.next == nil
      prc.call(current_node)
      current_node = current_node.next
    end
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
