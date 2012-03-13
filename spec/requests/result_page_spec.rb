require 'spec_helper'

describe "result page" do
  before :all do
    @image = new_image
    @image.save
  end

  it "shows preview images" do
    visit result_path(@image)
    src1 = find('.intro .left .picture img')['src']
    src2 = find('.intro .right .picture img')['src']
    visit src1
    visit src2
  end
  
  after :all do
    Image.destroy_all
  end
end
