class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
