class Article < ApplicationRecord
    validates :title, presence: true, length: { maximum: 10 }
    validates :content, presence: true
end
