class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    if self == self.sort
      (self.length + 10).hash
    else
      (self.length + 20).hash
    end
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    result = ''
    self.each_char do |char|
      result += alphabet.find_index(char).to_s
    end
    result.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.sort.hash + self.values.sort.hash
  end
end
