FactoryGirl.define do
  factory :post do
    title 'Testing title'
    content 'post content'
    visible true
    accessible true
    commentable true
  end
  
  factory :invisible_post, :parent => :post do
    visible false
    content 'invisible post content'
  end
  
  factory :uncommentable_post, :parent => :post do
    commentable false
    content 'uncommentable post content'
  end
  
  factory :unaccessible_post, :parent => :post do
    content 'unaccessible post content'
    accessible false
  end
  
  factory :comment do
    association :post
    commenter 'Somebody'
    email 'sb@xxx.pl'
    content 'comment content'
    www 'sb.xxx.pl'
  end
  
  factory :without_www_comment, :parent => :comment do
    www nil
  end
end

