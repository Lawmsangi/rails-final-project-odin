class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :likes
    has_many :friends

    validates :name, presence: true
    validates :photo, presence: true
    validates :bio, presence: true
    validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

    def recent_posts 
        posts.order(created_at: :desc).limit(3)
    end
end
