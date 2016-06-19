class Category < ActiveRecord::Base
  has_many :posts, ->{ order("id DESC") }

end
