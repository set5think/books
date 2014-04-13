class Book < ActiveRecord::Base

  attr_reader :name
  attr_accessible :name

end
