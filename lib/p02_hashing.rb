class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed = 0
    self.each_with_index do |el,idx|
      hashed += el.hash * idx
    end
    hashed
  end
end

class String
  def hash
    hashed = 0
    self.chars.each_with_index do |char, idx|
      hashed += char.ord.hash * idx
    end
    hashed
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k, v|
      sum += k.to_s.ord.hash * v.to_s.ord.hash
    end
    sum
    # 0
  end
end
