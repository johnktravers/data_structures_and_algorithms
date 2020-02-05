gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './ruby/node'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new('pizza')
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_initialize
    assert_equal 'pizza', @node.data
    assert_nil @node.next_node
  end

  def test_set_next_node
    next_node = Node.new('ice cream')
    @node.set_next_node(next_node)

    assert_equal next_node, @node.next_node
  end

  def test_allows_next_node_argument
    node = Node.new('popsicle', Node.new('tea'))

    assert_instance_of Node, node.next_node
    assert_equal 'tea', node.next_node.data
  end
end
