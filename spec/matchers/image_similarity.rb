module ImageSimilarity
  RSpec::Matchers.define :be_similar_to do |dst|
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

      @diff_img, @diff_metric = src_img[0].compare_channel(dst_img[0], Magick::MeanSquaredErrorMetric)
      @diff_metric <= @mse.to_f
    end

    chain :with_mse_less_then do |mse|
      @mse = mse
    end

    failure_message do |actual|
      "expected that mse #{@diff_metric} would be less or equal #{@mse.to_f}"
    end
  end
end
