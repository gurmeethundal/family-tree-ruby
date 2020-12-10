require_relative 'lib/family_history'
require_relative 'lib/family_tree'

puts "Started processing...\n"
puts "Loading family tree data...\n"
family = FamilyTree.new(FamilyHistory.record)
root = family.root
puts "Printing initial family tree..."
family.print

puts "ADD_CHILD 'Flora' 'Minerva' 'female' => " + family.add_child('Flora', 'Minerva', 'female')
puts "Family tree after adding new child"
family.print


puts "GET_RELATIONSHIP 'King Aurther' 'sons' => " + family.get_relationship('King Aurther', 'sons')
puts "GET_RELATIONSHIP 'King Aurther' 'daughter' => " + family.get_relationship('King Aurther', 'daughter')
puts "GET_RELATIONSHIP 'Bill' 'sons' => " + family.get_relationship('Bill', 'sons')
puts "GET_RELATIONSHIP 'Bill' 'daughters' => " + family.get_relationship('Bill', 'daughters')
puts "GET_RELATIONSHIP 'King Aurther' 'siblings' => " + family.get_relationship('King Aurther', 'siblings')
puts "GET_RELATIONSHIP 'Ronald' 'siblings' => " + family.get_relationship('Ronald', 'siblings')
puts "GET_RELATIONSHIP 'Harry' 'siblings' => " + family.get_relationship('Harry', 'siblings')
puts "GET_RELATIONSHIP 'Moly' 'siblings' => " + family.get_relationship('Moly', 'siblings')
puts "GET_RELATIONSHIP 'Ted' 'siblings' => " + family.get_relationship('Ted', 'siblings')
puts "GET_RELATIONSHIP 'Victoire' 'siblings' => " + family.get_relationship('Victoire', 'siblings')
puts "GET_RELATIONSHIP 'Gurmeet' 'siblings' => " + family.get_relationship('Gurmeet', 'siblings')
puts "GET_RELATIONSHIP 'Audrey' 'brother_in_law' => " + family.get_relationship('Audrey', 'brother_in_law')
puts "GET_RELATIONSHIP 'Ted' 'brother_in_law' => " + family.get_relationship('Ted', 'brother_in_law')
puts "GET_RELATIONSHIP 'Ronald' 'brother_in_law' => " + family.get_relationship('Ronald', 'brother_in_law')
puts "GET_RELATIONSHIP 'Ginerva' 'sister_in_law' => " + family.get_relationship('Ginerva', 'sister_in_law')
puts "GET_RELATIONSHIP 'Louis' 'sister_in_law' => " + family.get_relationship('Louis', 'sister_in_law')
puts "GET_RELATIONSHIP 'Lily' 'sister_in_law' => " + family.get_relationship('Lily', 'sister_in_law')
puts "GET_RELATIONSHIP 'Remus' 'maternal_aunt' => " + family.get_relationship('Remus', 'maternal_aunt')
puts "GET_RELATIONSHIP 'Victoire' 'maternal_aunt' => " + family.get_relationship('Victoire', 'maternal_aunt')
puts "GET_RELATIONSHIP 'William' 'maternal_aunt' => " + family.get_relationship('William', 'maternal_aunt')
puts "GET_RELATIONSHIP 'Remus' 'paternal_aunt' => " + family.get_relationship('Remus', 'paternal_aunt')
puts "GET_RELATIONSHIP 'Victoire' 'paternal_aunt' => " + family.get_relationship('Victoire', 'paternal_aunt')
puts "GET_RELATIONSHIP 'William' 'paternal_aunt' => " + family.get_relationship('William', 'paternal_aunt')
puts "GET_RELATIONSHIP 'Remus' 'maternal_uncle' => " + family.get_relationship('Remus', 'maternal_uncle')
puts "GET_RELATIONSHIP 'Victoire' 'maternal_uncle' => " + family.get_relationship('Victoire', 'maternal_uncle')
puts "GET_RELATIONSHIP 'William' 'maternal_uncle' => " + family.get_relationship('William', 'maternal_uncle')
puts "GET_RELATIONSHIP 'Remus' 'paternal_uncle' => " + family.get_relationship('Remus', 'paternal_uncle')
puts "GET_RELATIONSHIP 'Victoire' 'paternal_uncle' => " + family.get_relationship('Victoire', 'paternal_uncle')
puts "GET_RELATIONSHIP 'William' 'paternal_uncle' => " + family.get_relationship('William', 'paternal_uncle')

