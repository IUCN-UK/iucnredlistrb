# frozen_string_literal: true

require_relative "lib/iucnredlistrb/version"

Gem::Specification.new do |spec|
  spec.name = "iucnredlistrb"
  spec.version = IUCNRedListRb::VERSION
  spec.authors = ["Ian Townsend"]
  spec.email = ["conservation.informatics@iucn.org"]

  spec.summary = "A Ruby Gem that wraps the IUCN Red List API for fetching assessment data."
  spec.description = "This gem provides a simple interface to interact with the IUCN Red List API https://api.iucnredlist.org/."
  spec.homepage = "https://github.com/IUCN-UK/iucnredlistrb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/IUCN-UK/iucnredlistrb"
  spec.metadata["changelog_uri"] = "https://github.com/IUCN-UK/iucnredlistrb/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # gemspec = File.basename(__FILE__)
  File.basename(__FILE__)
  # spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
  #   ls.readlines("\x0", chomp: true).reject do |f|
  #     (f == gemspec) ||
  #       f.start_with?(*%w[bin/ test/ spec/ .git .github appveyor Gemfile])
  #   end
  # end
  spec.files = Dir.glob("lib/**/*", File::FNM_DOTMATCH)

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
