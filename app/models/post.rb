class Post < ApplicationRecord
   belongs_to :user
   # validates :title, presence: true,
   # length: { minimum:5 }
   has_many :post_tags, dependent: :destroy
   has_many :tags, through: :post_tags

end
