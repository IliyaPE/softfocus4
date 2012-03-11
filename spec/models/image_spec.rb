require 'spec_helper'

describe Image do
  it "have default blur and alpha" do
    img = Image.new
    img.alpha.should > 0
    img.blur.should > 0
  end
end
