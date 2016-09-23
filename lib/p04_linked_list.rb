# include 'Enumerable'

class Link


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
end

class LinkedList
  include Enumerable

  def initialize
    @s_head = Link.new
    @s_tail = Link.new
    @s_head.next = @s_tail
    @s_tail.prev = @s_head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @s_head.next
  end

  def last
    @s_tail.prev
  end

  def empty?
    @s_head.next == @s_tail
    @s_tail.prev == @s_head
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)

      self.each do |link|
        return link.val = val if link.key == key
      end

      new_link = Link.new(key, val)
      @s_tail.prev.next = new_link
      new_link.prev = @s_tail.prev
      new_link.next = @s_tail
      @s_tail.prev = new_link
      new_link

  end

  def remove(key)
    target_link = nil
    each do |link|
       target_link = link if link.key == key
    end
    target_link.prev.next = target_link.next
    target_link.next.prev = target_link.prev
    # target_link.next=nil
    # target_link.prev=nil
  end

  def each
    current_link = first

    until current_link == @s_tail
        yield(current_link)
        current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
