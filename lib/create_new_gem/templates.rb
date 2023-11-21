module CreateNewGem
  module Templates
    class Gemspec
      def initialize(gemname:,gemclass:,summary:,description:,authors:,email:,require_path:"['lib']",dependencies:,homepage:,license:)
        added_runtime_dependencies = []
        dependencies.each do |dep|
          added_runtime_dependencies << "#{gemname}.add_runtime_dependency '#{dep[0]}', '#{dep[1]}'"
        end

        @template = File.read("#{File.dirname __FILE__}/templates/gemspec.rb.template")
          .gsub("<<!gemname!>>", gemname)
          .gsub("<<!gemclass!>>", gemclass)
          .gsub("<<!summary!>>", summary)
          .gsub("<<!description!>>", description)
          .gsub("<<!authors!>>", authors.to_s)
          .gsub("<<!email!>>", email)
          .gsub("<<!require_paths!>>", require_path.to_s)
          .gsub("<<!homepage!>>", homepage)
          .gsub("<<!license!>>", license)
          .gsub("<<!runtime_dependencies!>>", added_runtime_dependencies.join("\n"))
      end
      
      def to_s
        return @template
      end
    end

    class Bin
      def initialize(gemname:)
        @template = File.read("#{File.dirname __FILE__}/templates/bin.template")
          .gsub("<<!gemname!>>", gemname)
      end

      def to_s
        return @template
      end
    end

    class Mainfile
      def initialize(gemname:,gemclass:,requires:,executables:)
        require_statements = []
        requires.each do |req|
          require_statements << "require '#{req}'"
        end

        @template = File.read("#{File.dirname __FILE__}/templates/mainfile.rb.template")
          .gsub("<<!gemclass!>>", gemclass)
          .gsub("<<!gemname!>>", gemname)
          .gsub("<<!requires!>>", require_statements.join("\n"))
          .gsub("<<!executables!>>", executables)
      end

      def to_s
        return @template
      end
    end
  end
end
