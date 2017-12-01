
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "emoji_sentiment/version"

Gem::Specification.new do |spec|
  spec.name          = "emoji_sentiment"
  spec.version       = EmojiSentiment::VERSION
  spec.authors       = ["Stafford Brunk"]
  spec.email         = ["stafford@guildeducation.com"]

  spec.summary       = %q{Ruby implementation of Emoji Sentiment dataset}
  spec.description   = %q{Ruby implementation of the Emoji Sentiment dataset}
  spec.homepage      = "https://github.com/GuildEducationInc/emoji_sentimetn"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "emoji_regex"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
