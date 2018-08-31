

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      
      hash_val = key.hash
      @store[hash_val % num_buckets] << key
      @count += 1
    end
    
    resize!  if self.count >= num_buckets
  end

  def include?(key)
    hash_val = key.hash
    @store[hash_val % num_buckets].include?(key)
  end

  def remove(key)
    if self.include?(key)
      
      hash_val = key.hash
      @store[hash_val % num_buckets].delete(key)
      @count -= 1
    end
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
        hash_el = el.hash
        
        new_store[hash_el % new_store.length] << el
      end
    end
    @store = new_store
  end
end
