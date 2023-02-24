class Category < ApplicationRecord
    has_many :article
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
end