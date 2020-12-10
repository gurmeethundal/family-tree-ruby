require_relative 'lib/file_processor'

processor = FileProcessor.new(ARGV[0])
processor.process_file
