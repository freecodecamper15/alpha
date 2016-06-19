class Post < ActiveRecord::Base
  validates_presence_of :title, :content

  has_many :current_readers, ->{ where(["created_at > ?", Time.now - 7.day]).order("id DESC") }

  belongs_to :category

  has_one :author, :dependent => :destroy

  has_many :post_languageships
  has_many :languages, :through => :post_languageships
end
