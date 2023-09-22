# frozen-string-literal: true

# The implementation of a Linked List data structure (albeit  kind of useless for Ruby)
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    # Adds a new node containing value to the end of the list
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    # Adds a new node containing value to the start of the list
    if @head.nil?
      @head = Node.new(value)
    else
      current_head = @head
      new_head = Node.new(value)
      new_head.next_node = current_head
      @head = new_head
    end
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
    self.tail = nil
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
    linked_list_string
  end

  def insert_at(value, index)
    # Inserts a new node with the provided value at the given index
    return puts 'Error: out of bounds not allowed' if index.negative? || index > (size - 1)

    if index.zero?
      prepend(value)
    elsif index == (size - 1)
      append(value)
    else
      new_node = Node.new(value)
      previous_node = at(index - 1)
      next_node = at(index)
      previous_node.next_node = new_node
      new_node.next_node = next_node
    end
  end

  def remove_at(index)
    # Removes the node at the given index
    return if at(index).nil?

    previous_node = at(index - 1)
    node_to_remove = at(index)

    if node_to_remove == head
      @head = @head.next_node
    else
      previous_node.next_node = node_to_remove.next_node
    end
    node_to_remove = nil
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
