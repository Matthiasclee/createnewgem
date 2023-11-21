module CreateNewGem
  @@files = ['helptext.rb'] # All gem files
  @@exe = ['gemnew'] # All executables

  def self.version
    "0.0.1"
  end

  def self.executables
    @@exe
  end

  def self.file_paths(relative:false)
    x = @@files.map do |f|
      "#{"lib/" unless relative}create_new_gem/#{f}"
    end

    if relative
      return x
    else
      return x + ['lib/create_new_gem.rb']
    end
  end
end

# Additional Requires
require "argparse"

CreateNewGem.file_paths(relative:true).each do |f|
  require_relative f
end
