require 'spec_helper'

describe "Main" do
  it "should not display a local file" do
    get :show, :path => "../../Gemfile"
    response.response_code.should == 404
  end
  
  it "authorizing"
end
