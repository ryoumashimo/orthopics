class Post < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end
end
