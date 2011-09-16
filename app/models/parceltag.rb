class Parceltag < ActiveRecord::Base
  belongs_to :parcel
  belongs_to :tag
end
