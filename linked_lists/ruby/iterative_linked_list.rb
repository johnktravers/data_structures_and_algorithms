require './ruby/node'


class IterativeLinkedList
  attr_reader :head, :count

  def initialize()
    @head = nil
    @count = 0
  end

  def push(data)
    if !head
      @head = Node.new(data)
      @count += 1
    else
      last_node.set_next_node(Node.new(data))
      @count += 1
    end
  end

  def pop
    if count == 1
      delete_head_node
    elsif count > 1
      data = last_node.data
      last_two_nodes[0].remove_next_node
      @count -= 1
      data
    end
  end

  def delete(data)
    return delete_head_node if count == 1
    previous_node = nil
    current_node = head
    until current_node.data == data
      return if !current_node.next_node
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.set_next_node(current_node.next_node) if previous_node
    @head = current_node.next_node if !previous_node
    @count -= 1
  end

  def include?(data)
    current_node = head
    until !current_node.next_node
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    false
  end

  def find(data)
    current_node = head
    until !current_node.next_node
      return current_node if current_node.data == data
      current_node = current_node.next_node
    end
  end

  def insert(position, data)
    current_node = head
    (position - 1).times { current_node = current_node.next_node }
    new_node = Node.new(data)
    next_node = current_node.next_node
    current_node.set_next_node(new_node)
    new_node.set_next_node(next_node)
    @count += 1
  end

  def insert_after(node_data, data)
    current_node = head
    until current_node.data == node_data
      return if !current_node.next_node
      current_node = current_node.next_node
    end
    new_node = Node.new(data)
    next_node = current_node.next_node
    current_node.set_next_node(new_node)
    new_node.set_next_node(next_node)
    @count += 1
  end

  def index(data)
    count = 0
    current_node = head
    until current_node.data == data
      return if !current_node.next_node
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def distance(data_1, data_2)
    (index(data_2) - index(data_1)).abs
  end

  def to_a
    list_array = []
    current_node = head
    count.times do
      list_array << current_node.data
      current_node = current_node.next_node
    end
    list_array
  end

  def last_node
    last_two_nodes[1]
  end

  def last_two_nodes
    previous_node = nil
    current_node = head
    until !current_node.next_node do
      previous_node = current_node
      current_node = current_node.next_node
    end
    [previous_node, current_node]
  end

  def head_node
    head
  end

  def delete_head_node
    data = head.data
    @count -= 1
    data
  end
end
