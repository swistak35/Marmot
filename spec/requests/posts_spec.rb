require 'spec_helper'

describe "Posts" do
  it "shouldnt be valid without title" do
    p = Factory.build :post
    p.title = nil
    p.should_not be_valid
  end
  
  it "should be valid without content" do
    p = Factory.build :post
    p.content = nil
    p.should be_valid
  end
  
  context "unaccessible post" do  
    it "shouldnt display unaccessible post" do
      Factory :unaccessible_post
      visit blog_posts_path
      page.should_not have_content "unaccessible post content"
    end
  end
  
  context "invisible post" do
    it "shouldnt display invisible but accessible post" do
      Factory :invisible_post
      visit blog_posts_path
      page.should_not have_content "invisible post content"
    end
    
    it "should display visible post" do
      Factory :post
      visit blog_posts_path
      page.should have_content "post content"
    end
  end
end
