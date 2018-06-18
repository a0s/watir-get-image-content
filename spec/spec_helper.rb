require 'rmagick'
require 'rspec/expectations'
require 'watir-get-image-content'
require 'rbconfig'
require 'matchers/image_similarity'
require 'matchers/image_size'

if RbConfig::CONFIG['host_os'] =~ /linux/
  dir = '/usr/lib/chromium-browser/'
  unless ENV['PATH'].include?(dir)
    if File.exist?(dir)
      ENV['PATH'] = "#{ENV['PATH']}#{File::PATH_SEPARATOR}#{dir}"
    end
  end
end

tmp = File.expand_path(File.join(__FILE__, %w(.. .. tmp)))
FileUtils.mkdir_p(tmp)

RSpec.configure do |spec|
  include ImageSimilarity
  include ImageSize

  spec.before(:all) do
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    args = ['--disable-notifications',
            '--unsafely-treat-insecure-origin-as-secure',
            '--disable-web-security',
            '--allow-file-access',
            '--allow-file-access-from-files',
            "--user-data-dir=#{tmp}"]
    @browser = Watir::Browser.new :chrome, desired_capabilities: caps, args: args
    @browser.goto "file://#{Dir.pwd}/spec/spec.html"
  end

  spec.after(:all) do
    @browser.quit
  end

  spec.after(:each) do
    @browser.refresh
  end
end
