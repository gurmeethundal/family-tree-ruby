require_relative 'family_history'
require_relative 'family_tree'

class FileProcessor
  attr_reader :file_full_path, :family, :errors

  def initialize(file_path=nil)
    @errors = []
    @family = FamilyTree.new(FamilyHistory.record)
    @file_full_path = file_path
  end

  def process_file
    puts errors.join("\n") unless file_exists?
    file = File.open(file_full_path, 'r')
    file.each_line do |line|
      next if blank_line?(line)
      line_parts = line.to_s.strip.split.reject(&:empty?)
      method = line_parts[0].downcase
      next unless valid_operation?(method) #SKIP unknown operations
      method_args = process_tokens(line.downcase, line_parts[1..-1])      
      puts family.public_send(method, *method_args)
    end
    file.close
  end

  private

  def file_exists?
    @errors << "Missing inputfile." if file_full_path.empty?    
    @errors << "File '#{file_full_path}' file doesn't exist." unless File.exist?(file_full_path) && File.file?(file_full_path)
    errors.count == 0
  end

  def blank_line?(line)
    line.to_s.strip.empty?
  end

  def valid_operation?(op)
    %w[add_child get_relationship find_older].include?(op.downcase)
  end

  def process_tokens(line, line_parts)
    return process_edge_case_tokens('king arthur', line_parts) if line.include?('king arthur') 
    return process_edge_case_tokens('queen margret', line_parts) if line.include?('queen margret')
    line_parts 
  end

  def process_edge_case_tokens(text, args)
    text_parts = text.split
    new_args = []
    add_suffix = false
    args.each_with_index do |part, part_index|  
      if part.downcase == text_parts[0] && args[part_index+1]&.downcase == text_parts[1]
        add_suffix = true
        next
      elsif add_suffix
        new_args << "#{args[part_index-1]} #{part}"
        add_suffix = false
      else 
        new_args << part
      end
    end 
    new_args
  end
end
