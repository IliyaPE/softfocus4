require 'spec_helper'

describe Admin::ImagesController do
  it "reject unauthenticated" do
    visit admin_images_path
    page.status_code.should == 401
  end

  it "allows authenticated use" do
    page.driver.browser.basic_authorize('bigbourin', 'secret')
    visit admin_images_path
    page.status_code.should == 200
  end
end
