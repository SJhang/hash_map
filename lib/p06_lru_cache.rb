require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map[key]
      update_link!(@map[key]) #@map[key] returns link from map to linked_list
      @map[key].val
    else
      calc!(key)
    end

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    new_link = @store.insert(key,val) #@map.set might do this for us already
    @map[key] = new_link#.set(new_link.key, new_link.val)

    if count > @max
      eject!
    end

    new_link.val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @store.remove(link.key)
    @store.insert(link.key, link.val)
  end

  def eject!

      @map.delete(@store.first.key)
      @store.remove(@store.first.key)

  end
end
