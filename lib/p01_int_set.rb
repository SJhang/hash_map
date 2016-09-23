class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
      if @store[num]==false
        @store[num]=true
      end
    false
  end

  def remove(num)
      if @store[num]==true
        @store[num]=false
      end
    raise "not included" if false
  end

  def include?(num)
    @store[num] == true
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
    return false if @store.include?(num)
    idx = num % num_buckets
    @store[idx] << num
  end

  def remove(num)
    @store.each do |bucket|
      bucket.each_index do |idx|
        if bucket[idx] == num
          bucket.delete_at(idx)
        end
      end
    end
  end

  def include?(num)
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
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

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if @store.include?(num)
    resize! if @count + 1 >= num_buckets
    idx = num % num_buckets
    @store[idx] << num
    @count+=1
  end

  def remove(num)
    @store.each do |bucket|
      bucket.each_index do |idx|
        if bucket[idx] == num
          bucket.delete_at(idx)
          @count-=1
        end
      end
    end
  end

  def include?(num)

    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
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
