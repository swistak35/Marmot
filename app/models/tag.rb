class Tag < ActiveRecord::Base
  has_many :posttags, :dependent => :destroy
  has_many :posts, :through => :posttags
  has_many :parceltags, :dependent => :destroy
  has_many :parcels, :through => :parceltags
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
