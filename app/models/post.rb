class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :taggings
  has_many :tags, through: :taggings

end
 