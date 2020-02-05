require './ruby/node'


class RecursiveLinkedList
  attr_reader :head, :count

  def initialize()
    @head = nil
    @count = 0
  end

  def push(data, current_node = head)
    if !current_node
      @head = Node.new(data)
      @count += 1
    elsif !current_node.next_node
      current_node.set_next_node(Node.new(data))
      @count += 1
    else
      push(data, current_node.next_node)
    end
  end

  def pop(previous_node = nil, current_node = head)
    return if !current_node
    if !current_node.next_node
      data = current_node.data
      previous_node.remove_next_node if previous_node
      @count -= 1
      data
    else
      pop(current_node, current_node.next_node)
    end
  end

  def delete(data, previous_node = nil, current_node = head)
    return if !current_node
    if current_node.data == data
      next_node = current_node.next_node
      previous_node.set_next_node(next_node) if previous_node
      @count -= 1
      current_node.data
    else
      delete(data, current_node, current_node.next_node)
    end
  end

  def to_a(list_array = [], current_node = head)
    return list_array if !current_node
    list_array.push(current_node.data)
    to_a(list_array, current_node.next_node)
  end

  def last_node(current_node = head)
    if !current_node.next_node
      current_node
    else
      last_node(current_node.next_node)
    end
  end

  def head_node
    head
  end

  def include?(data, current_node = head)
    return false if !current_node
    if current_node.data == data
      true
    else
      include?(data, current_node.next_node)
    end
  end

  def find(data, current_node = head)
    return if !current_node
    if current_node.data == data
      current_node
    else
      find(data, current_node.next_node)
    end
  end

  def insert(position, data, count = 1, current_node = head)
    if count == position
      new_node = Node.new(data)
      next_node = current_node.next_node
      current_node.set_next_node(new_node)
      new_node.set_next_node(next_node)
      @count += 1
    else
      insert(position, data, count + 1, current_node.next_node)
    end
  end

  def index(data, count = 0, current_node = head)
    return count if current_node.data == data
    index(data, count + 1, current_node.next_node)
  end

  def insert_after(data_1, data_2, current_node = head)
    node_1 = find(data_1)
    node_3 = node_1.next_node
    node_2 = Node.new(data_2)
    node_1.set_next_node(node_2)
    node_2.set_next_node(node_3)
    @count += 1
  end

  def distance(data_1, data_2)
    (index(data_2) - index(data_1)).abs
  end
end
