require 'spec_helper'

describe 'watir-get-image-content' do
  describe '#to_png_base64' do
    it 'from png' do
      expect(@browser.image(:alt, 'png').to_png_base64).to be_similar_to(File.join(Dir.pwd), %w(spec images png.png))
    end

    it 'from gif' do
      expect(@browser.image(:alt, 'gif').to_png_base64).to be_similar_to(File.join(Dir.pwd), %w(spec images gif.gif))
    end

    it 'from jpg' do
      expect(@browser.image(:alt, 'jpg').to_png_base64).
          to be_similar_to(File.join(Dir.pwd), %w(spec images jpg.jpg)).with_mse_less_then(0.0000001)
    end
  end

  describe '#to_png' do
    it 'from png' do
      expect(@browser.image(:alt, 'png').to_png).to be_similar_to(File.join(Dir.pwd), %w(spec images png.png))
    end

    it 'from gif' do
      expect(@browser.image(:alt, 'gif').to_png).to be_similar_to(File.join(Dir.pwd), %w(spec images gif.gif))
    end

    it 'from jpg' do
      expect(@browser.image(:alt, 'jpg').to_png).
          to be_similar_to(File.join(Dir.pwd), %w(spec images jpg.jpg)).with_mse_less_then(0.0000001)
    end
  end

  describe '#to_jpg_base64' do
    it 'from png' do
      expect(@browser.image(:alt, 'png').to_jpg_base64).to be_similar_to(File.join(Dir.pwd), %w(spec images png.png))
    end

    it 'from gif' do
      expect(@browser.image(:alt, 'gif').to_jpg_base64).to be_similar_to(File.join(Dir.pwd), %w(spec images gif.gif))
    end

    it 'from jpg' do
      expect(@browser.image(:alt, 'jpg').to_jpg_base64).
          to be_similar_to(File.join(Dir.pwd), %w(spec images jpg.jpg)).with_mse_less_then(0.0000001)
    end
  end

  describe '#to_jpg' do
    it 'from png' do
      expect(@browser.image(:alt, 'png').to_jpg).to be_similar_to(File.join(Dir.pwd), %w(spec images png.png))
    end

    it 'from gif' do
      expect(@browser.image(:alt, 'gif').to_jpg).to be_similar_to(File.join(Dir.pwd), %w(spec images gif.gif))
    end

    it 'from jpg' do
      expect(@browser.image(:alt, 'jpg').to_jpg).
          to be_similar_to(File.join(Dir.pwd), %w(spec images jpg.jpg)).with_mse_less_then(0.0000001)
    end
  end
end
