require_relative 'linked_list_node'

class LinkedList
  attr_accessor :head

  def add(node:)
    if @head.nil?
      #If head is nil then save reference
      @head = node
    else
      #Otherwise, link to the currently last node
      last.next_node = node
    end
  end

  def delete(node:)
    return false if @head.nil? #Return false if head is nil

    found = false
    previous_node = nil
    current_node = @head

    while(!found) do
      if node == current_node #We found the node in the list
        if node == @head #Node is the current head
          @head = node.next_node #Set the next node as head
        else #Node is not the current head
          previous_node.next_node = node.next_node #Set the next_node reference of the previous node to the next_node reference of the current one
        end
        found = true
      else #We haven't found the node yet, continue to loop
        previous_node = node
        node = next_node
      end
    end

    return found
  end

  def last
    node = @head
    until node.next_node.nil? do
      #Start from head and continue to loop until we find a node without a next_node reference
      node = node.next_node
    end

    node
  end
end
