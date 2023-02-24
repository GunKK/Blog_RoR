class Article < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: {minimum: 10, maximun: 500}
    validates :user_id, presence: true
end