require "spec_helper"


describe "watir-get-image-content" do
  describe "#to_png_base64" do
    it "return png image similar to the original png" do
      src_file = "#{Dir.pwd}/spec/images/png.png".sub("file://", '')
      enc_base64 = @browser.image(:alt, 'png').to_png_base64
      expect(enc_base64).to be_similar_to_file(src_file)
    end

    it "return png image similar to the original gif" do
      src_file = "#{Dir.pwd}/spec/images/gif.gif".sub("file://", '')
      enc_base64 = @browser.image(:alt, 'gif').to_png_base64
      expect(enc_base64).to be_similar_to_file(src_file)
    end

    it "return png image similar to the original jpg with mse <= 0.0000001" do
      src_file = "#{Dir.pwd}/spec/images/jpg.jpg".sub("file://", '')
      enc_base64 = @browser.image(:alt, 'jpg').to_png_base64
      expect(enc_base64).to be_similar_to_file(src_file).with_mse_less_then(0.0000001)
    end
  end
end