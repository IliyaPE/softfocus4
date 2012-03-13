require 'spec_helper'

describe "result page" do
  before :each do
    @image = new_image
    @image.save
  end

  it "shows preview images" do
    visit result_path(@image)
    src1 = find('.intro .left .picture img')['src']
    src2 = find('.intro .right .picture img')['src']
    link = find('.intro .right .download a')['href']
    src1.should == @image.file.url(:half)
    src2.should == @image.file.url(:halfsoft)
    link.should == download_path(@image)
    visit src1
    visit src2
    visit link
  end

  it "should reject unknown ip" do
    @image.owner.update_attribute :ip, '8.8.4.4'
    visit result_path(@image)
    page.status_code.should == 403
  end
  
  after :all do
    Image.destroy_all
  end
end
