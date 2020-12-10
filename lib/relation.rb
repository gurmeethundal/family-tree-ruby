module Relation
  def sibling(for_name=nil)
    return 'NONE' if member.name.downcase != for_name
    sn = sibling_nodes(for_name)
    return 'NONE' if sn.count < 1
    sn.map{|c| c.member.name }.join(' ')
  end
  alias siblings sibling

  def son(for_name_=nil)
    return 'NONE' if children.count < 1
    out = []
    children.each do |c| 
      next if c.member.gender != 'male' 
      out << c.member.name 
    end
    return 'NONE' if out.count < 1
    out.join(' ')
  end
  alias sons son

  def daughter(for_name_=nil)
    return 'NONE' if children.count < 1
    out = []
    children.each do |c| 
      next if c.member.gender != 'female' 
      out << c.member.name 
    end
    return 'NONE' if out.count < 1
    out.join(' ')
  end
  alias daughters daughter

  def brother_in_law(for_name=nil)
    sn = sibling_nodes
    return 'NONE' if sn.count < 1
    is_member = member.name.downcase == for_name
    out = []
    sibling_nodes.each do |c| 
      if is_member
        out << c.spouse.name if c.spouse && c.spouse.gender == 'male'
      else
        out << c.member.name if c.member.gender == 'male'
      end
    end
    retun 'NONE' if out.count < 1
    out.join(' ')
  end
  alias brother_in_laws brother_in_law

  def sister_in_law(for_name=nil)
    sn = sibling_nodes
    return 'NONE' if sn.count < 1
    out = []
    is_member = member.name.downcase == for_name
    sibling_nodes.each do |c| 
      if is_member
        out << c.spouse.name if c.spouse && c.spouse.gender == 'female'
      else
        out << c.member.name if c.member.gender == 'female'
      end
    end
    return 'NONE' if out.count < 1
    out.join(' ')   
  end
  alias sister_in_laws sister_in_law

  def maternal_aunt(for_name=nil)
    grand_parent = parent&.parent
    return 'NONE' if parent.nil? || 
                     grand_parent.nil? || 
                     grand_parent.children.count < 2
    out = []
    is_parent_member = parent.member.name == parent.female_member.name
    return 'NONE' unless is_parent_member
    parent_sibling = parent.sibling_nodes(parent.member.name.downcase)
    parent_sibling.each do |c|
      out << c.member.name if c.member.gender == 'female'
    end
    retun 'NONE' if out.count < 1
    out.join(' ')
  end
  alias maternal_aunts maternal_aunt

  def paternal_aunt(for_name=nil)
    grand_parent = parent&.parent
    return 'NONE' if parent.nil? || 
                     grand_parent.nil? || 
                     grand_parent.children.count < 2
    out = []
    is_parent_member = parent.member.name == parent.male_member.name
    return 'NONE' unless is_parent_member
    parent_sibling = parent.sibling_nodes(parent.member.name.downcase)
    parent_sibling.each do |c|
      out << c.member.name if c.member.gender == 'female'
    end
    retun 'NONE' if out.count < 1
    out.join(' ')
  end
  alias paternal_aunts paternal_aunt

  def maternal_uncle(for_name=nil)
    grand_parent = parent&.parent
    return 'NONE' if parent.nil? || 
                     grand_parent.nil? || 
                     grand_parent.children.count < 2
    out = []
    is_parent_member = parent.member.name == parent.female_member.name
    return 'NONE' unless is_parent_member
    parent_sibling = parent.sibling_nodes(parent.member.name.downcase)
    parent_sibling.each do |c|
      out << c.member.name if c.member.gender == 'male'
    end
    retun 'NONE' if out.count < 1
    out.join(' ')
  end
  alias maternal_uncles maternal_uncle

  def paternal_uncle(for_name=nil)
    grand_parent = parent&.parent
    return 'NONE' if parent.nil? || 
                     grand_parent.nil? || 
                     grand_parent.children.count < 2
    out = []
    is_parent_member = parent.member.name == parent.male_member.name
    return 'NONE' unless is_parent_member
    parent_sibling = parent.sibling_nodes(parent.member.name.downcase)
    parent_sibling.each do |c|
      out << c.member.name if c.member.gender == 'male'
    end
    retun 'NONE' if out.count < 1
    out.join(' ')    
  end
  alias paternal_uncles paternal_uncle
end