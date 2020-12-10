require_relative 'person'
require_relative 'relation'

class Node
  attr_accessor :member, :parent, :spouse, :children, :depth
  include Relation

  def initialize(member_name, member_gender, parent_node=nil, spouse_name=nil)
    @parent = parent_node
    @depth = parent_node ? (parent_node.depth) + 1 : 0
    @member = Person.new(member_name, member_gender) 
    @spouse = Person.new(spouse_name, spouse_gender) if spouse_name
    @children = []
  end

  def mother_name
    female_member.name
  end

  def father_name
    male_member.name
  end

  def female_member
    return member if member.gender == 'female'
    spouse
  end

  def male_member
    return member if member.gender == 'male'
    spouse
  end

  def has_child_with_name?(name)
    children.any?{|c| c.member.name.downcase == name}
  end

  def last_child?
    return if parent.nil?
    parent.children.last.member.name == member.name
  end

  def node_content
    out = member_content
    out << ", #{spouse_content}" if spouse_content.length > 0 
    out
  end

  def sibling_nodes(for_name=nil)
    return [] if parent.nil? || parent.children.count < 2
    parent.children.reject{|c| c.member.name.downcase == (for_name || member.name.downcase) }
  end



  private

  def spouse_gender
    return 'female' if member.gender == 'male'
    'male'
  end

  def member_gender_initial
    member.gender[0].upcase
  end

  def spouse_gender_initial
    spouse.gender[0].upcase
  end

  def member_identifier
    'C'
  end

  def spouse_identifier
    'S'
  end

  def member_content
    return '' if member.nil?
    "#{member.name} [#{member_gender_initial}](#{member_identifier})"
  end

  def spouse_content
    return '' if spouse.nil?
    "#{spouse.name} [#{spouse_gender_initial}](#{spouse_identifier})"
  end
end
