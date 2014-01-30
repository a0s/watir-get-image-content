# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "watir-get-image-content"
  spec.version       = "0.0.1"
  spec.authors       = ["orangeudav"]
  spec.email         = ["orangeudav@gmail.com"]
  spec.description   = %q{Get image content}
  spec.summary       = %q{Get content of selected image w/o external (re)download}
  spec.homepage      = "https://github.com/orangeudav/watir-get-image-content"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "watir-webdriver"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rmagick"
end
