module CreateNewGem
  module HelpText
    def self.helptext
      v = CreateNewGem.version

text = <<A
Create New Gem v#{v}
Matthias Lee <matthias@matthiasclee.com>

Usage: gemnew [gem name] [class name] (opts)
gem name: Name of the gem. All lowercase, [a-z 0-9 _ -] EX: coolgem, create_new_gem
class name: Gem class name. [A-z 0-9 _] EX: CoolGem, CreateNewGem

Options:
--add_depends '<dependencies>': Adds dependencies. Use form "rbtext:>=0.3.3,argparse:>=0.0.3"
--add_requires '<requires>': Adds require statements. Use form "rbtext,rbtext/string_methods,argparse"
--add_executables '<executables>': Adds executables to the gem. Use form "exe1,exe2"
--add_directories '<directories>': Adds additional base directiories. Use form "files,another_one"
--summary '<summary>': Adds summary
--description '<description>': Adds description
--authors '<authors>': Adds authors. Use form "Matthias Lee,John Doe"
--email '<email>': Adds email address
--homepage '<homepage>': Adds homepage
--no_git: Doesn't initialize git
--help: Shows the help menu
A
    end
  end
end
