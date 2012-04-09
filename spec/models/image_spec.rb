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

  it "errors on invalid image" do
    img = new_image :file => File.open("spec/fixtures/invalid.txt")
    img.save.should == false
    img.errors[:file_content_type].should_not be_empty
  end

  it "errors without image" do
    img = new_image :file => nil
    img.save.should == false
    img.errors[:file_file_name].should_not be_empty
  end
end
