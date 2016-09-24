require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each do |bucket|
      return true if bucket.include?(key)
    end
    false
  end

  def set(key, val)
    #return false if include?(key)
    resize! if @count + 1 >= num_buckets
    idx = key.hash % num_buckets
    @count+=1
    @store[idx].insert(key,val)

  end

  def get(key)
    each do |k, v|
      return v if k == key
    end
    nil
  end

  def delete(key)
    @store.each do |bucket|
      bucket.remove(key) if bucket.include?(key)
    end
    @count-=1
  end

  def each
    @store.each do |bucket|
      bucket.each do |list|
        yield(list.key, list.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times do
      @store << LinkedList.new
    end
  end

  def bucket(key)
    # optional but useful;  return the bucket corresponding to `key`

  end
end
