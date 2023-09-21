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

  def head
    # Returns the first node in the list
    @head
  end

  def tail
    # Returns the last node in the list
    tail = @head
    tail = tail.next_node until tail.next_node.nil?
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
    # removes the last element from the list
  end

  def contains?(value)
    # returns true if the passed in value is in the list and otherwise returns false
  end

  def find(value)
    # returns the index of the node containing value, or nil if not found
  end

  def to_s
    # represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
    # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  end

  def insert_at(value, index)
    # inserts a new node with the provided value at the given index
  end

  def remove_at(value, index)
    # removes the node at the given index
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
