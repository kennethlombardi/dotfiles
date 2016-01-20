task default: [:link]

task :link do
  each_system_file("system") do |dot_file, system_file|
    puts "#{dot_file} => #{system_file}"
    make_directory(File.dirname(dot_file))
    link_file(system_file, dot_file)
  end
end

def each_system_file(system_dir)
  return unless File.exist?(system_dir)

  Dir.glob("#{system_dir}/**/**") do |systemfile|
    next unless File.file?(systemfile) || File.symlink?(systemfile)
    
    relative_file = without_directory(systemfile, system_dir)
    dotfile = home_path(dotify(relative_file))
    systemfile = expanded_path(systemfile)

    yield dotfile, systemfile
  end
end 

def without_directory(file, dir)
  file =~ /^#{dir}\/(.*)$/ && $1
end

def dotify(path)
  File.join path.split(File::SEPARATOR).map { |s| s.sub(/^_/, '.') }
end

def home_path(path)
  File.join(ENV['HOME'], path)  
end

def expanded_path(path)
  File.expand_path(path, File.dirname(__FILE__))
end

def make_directory(dir)
  mkdir_p(dir)
end

def link_file(src, dest)
  ln_sf(src, dest)
end
