class TodoList

  def initialize(ary)
      @items = ary
      #@ means an instance variable, accessed by other methods within the class
      #don't use @? it would have been a variable within this method
  end

  def get_items
    return @items
  end

  def add_item(item1)
    @items.push(item1)
  end

  def delete_item(item)
    @items.delete(item)
  end

  def get_item(idx)
    return @items[idx]
  end

end