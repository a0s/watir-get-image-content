Return content of image as base64-encoded png

## Installation

Add this line to your application's Gemfile:

    gem 'watir-get-image-content'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install watir-get-image-content

## Usage

```ruby
require 'watir-webdriver'
require 'watir-get-image-content'
browser = Watir::Browser.new
browser.goto 'http://for_example.com/page_with_images'

browser.image(:index, 1).to_png_base64         # get base64-encoded png of image selected by index
browser.image(:alt, 'Alt text').to_png_base64  # get base64-encoded png of image selected by alt text
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
