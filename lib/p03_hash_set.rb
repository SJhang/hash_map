require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    resize! if @count + 1 >= num_buckets
    idx = key.hash % num_buckets
    @store[idx] << key
    @count+=1
  end

  def include?(key)
    @store.each do |bucket|
      return true if bucket.include?(key)
    end
    false
  end

  def remove(key)
    @store.each do |bucket|
      bucket.each_index do |idx|
        if bucket[idx] == key
          bucket.delete_at(idx)
          @count-=1
        end
      end
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
    num_buckets.times do
      @store << []
    end
  end
end

test = HashSet.new(4)
test.insert(4)
test.insert([])
p test
