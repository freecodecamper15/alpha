class Language < ActiveRecord::Base
  has_many :post_languageships
  has_many :posts, :through => :post_languageships
end
