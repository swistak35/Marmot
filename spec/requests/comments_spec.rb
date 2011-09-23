require 'spec_helper'

describe "Comments" do
  it "shouldnt be valid when post = nil"
  
  it "shouldnt be valid when post isnt commentable"
  
  it "should disappear div after destroying"
  
  describe "SanitizeWWW" do
    it "should sanitize when mypage.pl" do
      c = Factory :comment
      c.www = "mypage.pl"
      c.save
      c.www.should == "http://mypage.pl"
    end
    
    it "shouldnt sanitize when http://mypage.pl" do
      c = Factory :comment
      c.www = "http://mypage.pl"
      c.save
      c.www.should == "http://mypage.pl"
    end
  end
end
