task :count_files do
  file_count = Dir.glob(File.join(Rails.root, '**', '*')).select {|file| File.extname(file) == '.rb' }.count
  puts "#{file_count} '.rb' files in this project"
end