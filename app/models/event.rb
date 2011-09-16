class Event < ActiveRecord::Base
  validates_presence_of :name
  
  def to_param
    "#{id}-#{name.gsub(/\s/,"-")}"
  end
end
