require 'rake'
require 'erb'

# Linked into the home directory under their own name instead of as a dotfile.
UNDOTTED = %w[AGENTS.md]

desc "Install the dot files into user's home directory"
task :install do
  replace_all = false

  Dir['*'].each do |file|
    next if %w[Rakefile README.md].include? file

    if File.exist?(File.join(ENV['HOME'], target_name(file)))
      if File.identical? file, File.join(ENV['HOME'], target_name(file))
        puts "identical ~/#{target_name(file)}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/#{target_name(file)}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{target_name(file)}"
        end
      end
    else
      link_file(file)
    end
  end
end

def target_name(file)
  UNDOTTED.include?(file) ? file : ".#{file.sub('.erb', '')}"
end

def replace_file(file)
  system %Q{rm -rf "$HOME/#{target_name(file)}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/#{target_name(file)}"
    File.open(File.join(ENV['HOME'], target_name(file)), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/#{target_name(file)}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/#{target_name(file)}"}
  end
end
