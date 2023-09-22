# The implementation of a Linked List data structure
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    # Adds a new node containing value to the end of the list
    @head.nil? ? prepend(value) : tail.next_node = Node.new(value)
  end

  def prepend(value)
    # Adds a new node containing value to the start of the list
    @head = @head.nil? ? Node.new(value) : Node.new(value, @head)
  end

  def size
    # Returns the total number of nodes in the list
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def tail
    # Returns the last node in the list
    tail = @head
    tail = tail.next_node until tail.next_node.nil? || @head.nil?
    tail
  end

  def at(index)
    # Returns the node at the given index
    current_index = 0
    current_node = @head
    until current_index == index || current_node.nil?
      current_index += 1
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    # Removes the last element from the list
    return if @head.nil?

    node = @head
    node = node.next_node until node.next_node.nil? || node.next_node.next_node.nil?
    node.next_node = nil
  end

  def contains?(value)
    # Returns true if the passed in value is in the list and otherwise returns false
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    # Returns the index of the node containing value, or nil if not found
    current_index = 0
    current_node = @head
    until current_node.nil?
      return current_index if current_node.value == value

      current_index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    # Represent LinkedList objects as strings, so you can print them out and preview them in the console.
    # The format is: ( value ) -> ( value ) -> ( value ) -> nil
    linked_list_string = ''
    current_node = @head
    until current_node.nil?
      linked_list_string.concat("( #{current_node.value} ) -> ")
      current_node = current_node.next_node
    end
    linked_list_string.concat('nil')
  end

  def insert_at(value, index)
    # Inserts a new node with the provided value at the given index
    return puts 'Error: out of bounds not allowed' if index.negative? || index > (size - 1)

    if index.zero?
      prepend(value)
    else
      at(index - 1).next_node = Node.new(value, at(index))
    end
  end

  def remove_at(index)
    # Removes the node at the given index
    return puts 'Error: out of bounds not allowed' if at(index).nil?

    # Basically we pass the reference to the node next to the one we are deleting to the node before it
    at(index - 1).next_node = at(index).next_node
  end
end

# The node object class used by the linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
