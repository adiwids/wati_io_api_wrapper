# frozen_string_literal: true

require_relative "lib/whatsapp_team_inbox/version"

Gem::Specification.new do |spec|
  spec.name = "whatsapp_team_inbox"
  spec.version = WhatsappTeamInbox::VERSION
  spec.authors = %w[adiwids adiwids-sjs]
  spec.email = %w[day4die@gmail.com adi.widyawan@sejasa.com]

  spec.summary = "Ruby wrapper to call WATI.io WhatsApp API."
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/adiwids/whatsapp_team_inbox"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.9"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/adiwids/whatsapp_team_inbox.git"
  spec.metadata["changelog_uri"] = "https://github.com/adiwids/whatsapp_team_inbox/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "typhoeus", "~> 1.0"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "simplecov", ">= 0.19.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
