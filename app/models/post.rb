class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    validates :title, presence: true
    validates :body, presence: true
    validates :likes_counter, numericality: { greater_than_or_equal_to: 0 } 
    validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }

    after_create :update_posts_count
    
    def recent_comments 
        comments.order(created_at: :desc).limit(3)
    end

    private

    def update_posts_count
        post_count = user.posts.count
        user.update(posts_counter: post_count)
    end

end
