class Post < ActiveRecord::Base
  validates_presence_of :title
  
  attr_accessible :title, :tag_tokens, :content, :visible, :accessible, :commentable
  attr_reader :tag_tokens
  
  has_many :tags, :through => :posttags
  has_many :comments, :dependent => :destroy
  has_many :posttags, :dependent => :destroy

  scope :recent, order("created_at DESC")
  scope :visible, where(:visible => true)
  scope :accessible, where(:accessible => true)
  scope :invisible, where(:visible => false)
  scope :unaccessible, where(:accessible => false)
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  def to_param
    "#{id}-#{title.gsub(/\s/,"-")}"
  end
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
end
