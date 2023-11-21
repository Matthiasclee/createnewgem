require_relative "lib/create_new_gem.rb"

Gem::Specification.new do |s|
  s.name        = 'create_new_gem'
  s.version     = CreateNewGem.version
  s.summary     = "Create a blank gem"
  s.description = "Create a blank gem"
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  s.files       = CreateNewGem.file_paths + CreateNewGem.executables.map{|i|"bin/#{i}"}
  s.executables = CreateNewGem.executables
  s.require_paths = ["lib"]
  s.add_runtime_dependency "argparse", '>= 0.0.3'
  s.add_runtime_dependency "etc", '>= 1.2.0'
  s.homepage = 'https://github.com/Matthiasclee/createnewgem'
end
