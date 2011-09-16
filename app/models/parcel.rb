class Parcel < ActiveRecord::Base
  has_attached_file :parcel, {
      :path => ":rails_root/public/:attachment/:id/:filename",
      :url => "/:attachment/:id/:filename" }
  validates_attachment_presence :parcel
  validates_attachment_size :parcel, :less_than => 10.megabytes
  
  has_many :parceltags, :dependent => :destroy
  has_many :tags, :through => :parceltags
  
  attr_accessible :tag_tokens, :parcel
  attr_reader :tag_tokens
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
end
