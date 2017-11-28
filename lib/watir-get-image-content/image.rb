# encoding: utf-8

require 'base64'

module Watir
  class Image
    def to_x_base64(target)
      assert_exists
      js = %Q{var canvas = document.createElement("canvas");
              canvas.width = arguments[1];
              canvas.height = arguments[2];
              var ctx = canvas.getContext("2d");
              ctx.drawImage(arguments[0], 0, 0);
              var dataURL = canvas.toDataURL("image/#{target}");
              return dataURL.replace(/^data:image\\/(png|jpg|gif);base64,/, "");}
      driver.execute_script js, @element, natural_width, natural_height
    end

    def to_png_base64
      to_x_base64('png')
    end

    def to_jpg_base64
      to_x_base64('jpg')
    end

    def to_png
      Base64.decode64(self.to_png_base64)
    end

    def to_jpg
      Base64.decode64(self.to_jpg_base64)
    end
  end
end
