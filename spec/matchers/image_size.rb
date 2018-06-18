module ImageSize
  RSpec::Matchers.define :be_same_size_as do |dst|
    match do |src|
      base64_re = %r{^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}=+)$}

      src_img, dst_img = [src, dst].map do |data|
        if src =~ base64_re
          Magick::Image.read_inline(src)
        elsif (File.exist?(src) rescue nil)
          Magick::Image.read(src)
        else
          tmp = Tempfile.new
          tmp.write(src)
          tmp.flush
          begin
            Magick::Image.read(tmp.path)
          ensure
            tmp.close
            tmp.unlink
          end
        end
      end

      @src_width, @src_height = src_img[0].columns, src_img[0].rows
      @dst_width, @dst_height = dst_img[0].columns, dst_img[0].rows
      @src_width == @dst_width && @src_height == @dst_height
    end

    failure_message do |actual|
      "expected that size of src image (#{@src_width},#{@src_height}) would be same as of dst image (#{@dst_width},#{@dst_height})"
    end
  end
end
