class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates_presence_of :commenter
  validates_presence_of :email
  validates_length_of :commenter, :within => 1..100
  validates_length_of :content, :within => 1..4000
  
  validate :post_commentable_must_be_true
  
  before_create :sanitize_www
  
  def sanitize_www
    self.www = (self.www =~ %r[^http://]) ? self.www : "http://" + self.www unless self.www.empty?
  end
  
  def post_commentable_must_be_true
    errors.add("", "Nie mozna komentowac") unless
      self.post.commentable?
  end
end
