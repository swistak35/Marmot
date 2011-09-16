require 'spec_helper'

describe "PostVisibles" do
  it 'not shown on posts_path when visible = false' do
    p = Post.new(:title => "sth title", :content => "invisible post content", :accessible => true, :commentable => true)
    p.visible = false
    p.save
    
    
    visit blog_posts_path
    page.should_not have_content("invisible post content")
  end
end
