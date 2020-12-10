require_relative 'node'

class FamilyTree
  attr_reader :root

  def initialize(family_data)
    root_data = family_data[0]
    @root = Node.new(root_data[:member], root_data[:member_gender], nil, root_data[:spouse])
    family_data.slice(1,2,3).each do |depth, nested_data|
      nested_data.each do |mother_name, childs|
        mother_node = find_mother_node(mother_name.downcase)
        childs.each do |child| 
          mother_node.children << Node.new(child[:member], child[:member_gender], mother_node, child[:spouse])  
        end 
      end
    end
  end

  def print
    puts print_from_node(root)
  end

  def add_child(mother_name, value, gender)
    val = value.to_s.strip.downcase
    mother_node = find_mother_node(mother_name.to_s.strip.downcase)
    if mother_node.nil?
      node = find_node_by_name(root, mother_name.to_s.strip.downcase)
      return "PERSON_NOT_FOUND" if node.nil?
      return 'CHILD_ADDITION_FAILED'
    end
    
    return 'CHILD_ALREADY_EXIST'if mother_node.has_child_with_name?(val)
    mother_node.children << Node.new(value, gender.downcase, mother_node)
    return "CHILD_ADDED"
  end

  def get_relationship(value, relation)
    val = value.to_s.strip.downcase
    node = find_node_by_name(root, val)
    return "PERSON_NOT_FOUND" if node.nil?
    # Below line is to support relationship with - and spaces
    rel_method = relation.to_s.gsub('-',' ').split.reject(&:empty?).map(&:downcase).join('_')
    return 'NONE' unless node.respond_to?(rel_method)
    node.public_send(rel_method, val)
  end

  def find_older(person1, person2)
    person1_node = find_node_by_name(root, person1.to_s.strip.downcase)
    return "PERSON_NOT_FOUND" unless person1_node
    person2_node = find_node_by_name(root, person2.to_s.strip.downcase)
    return "PERSON_NOT_FOUND" unless person2_node

    if person1_node.depth <= person2_node.depth
      return person1
    else
      return person2
    end
  end

  private

  def find_mother_node(value)
    find_node_by_name_gender(root, value, 'female')
  end

  def find_father_node(value)
    find_node_by_name_gender(root, value, 'male')
  end

  def find_node_by_name_gender(node, value, gender)
    return nil if node.nil?
    return node if (node.member && node.member.gender == gender && node.member.name.downcase == value) ||
                   (node.spouse && node.spouse.gender == gender && node.spouse.name.downcase == value)
    return nil if node.children.count < 1
    located_node = nil
    node.children.each do |child_node|
      located_node = find_node_by_name_gender(child_node, value, gender)
      break if located_node
    end
    located_node
  end

  def find_node_by_name(node, value)
    return nil if node.nil?
    return node if node.member.name.downcase == value ||
                   (node.spouse && node.spouse.name.downcase == value)
    return nil if node.children.count < 1
    located_node = nil
    node.children.each do |child_node|
      located_node = find_node_by_name(child_node, value)
      break if located_node
    end
    located_node
  end

  def print_from_node(node)
    return if node.nil?
    out = ''
    node_content_with_children(out, node);
    out
  end

  def node_content_with_children(buffer, node, leadin1=nil, leadin2=nil)
    return '' if node.nil?
    buffer << "#{leadin1}#{leadin2}#{node.node_content} \n"

    leadinnext = "#{leadin1}│  " if node.parent 
    leadinnext = "#{leadin1}   " if node.last_child?
    leadinchild = "└──"

    return '' if node.children.nil?
    node.children.each do |child|
      node_content_with_children(buffer, child, leadinnext, leadinchild );
    end
  end
end
