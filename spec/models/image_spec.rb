require 'spec_helper'

describe Image do
  it "have default blur and alpha" do
    img = Image.new
    img.alpha.should > 0
    img.blur.should > 0
  end

  it "are processed after save" do
    img = new_image
    img.save
    img.file?.should == true
    for style in img.file.styles.keys
      File.exists?(img.file.path(style)).should == true
    end
  end
end
