class Post < ApplicationRecord
  has_attached_file :image, :styles => { :medium => "205x205#", thumb: "100x100>" }

  # validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
