class MaxIntSet
  def initialize(max)
    # @store = Array.new(max) {Array.new}
    @store = Array.new(max,false)
  end

  def insert(num)
    raise 'Out of bounds' if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(buckets = 20)
    @store = Array.new(buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num) 
      @store[num % @store.length] << num 
      @count += 1
    end
    
    resize! if @count == num_buckets
    
  end

  def remove(num)
    if self.include?(num)
      @store[num % @store.length].delete(num)
      @count -=1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    
    @store.each do |bucket|
      bucket.each do |el|
        new_store[el % new_store.length] << el
              
      end
    end
    @store = new_store
    
  end
end
