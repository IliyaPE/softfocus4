require 'spec_helper'

describe "legacy page" do
  before :each do
    visit legacy_path
  end
  
  it "allow image upload with UTF-8 filenames" do  
    attach_file 'file', "spec/fixtures/jpn_すべての人間は.png"
    click_on 'Send'
    image = Image.last
    current_path.should == result_path(image)
  end

  after :all do
    Image.destroy_all
  end
end
