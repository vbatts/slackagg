class Links < ActiveRecord::Base
  validates_uniqueness_of :uri
end
