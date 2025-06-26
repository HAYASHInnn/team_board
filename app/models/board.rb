class Board < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { minimum: 1, maximum: 30 }
    validates :title, uniqueness: true

    validates :description, presence: true
    validates :description, length: { minimum: 1, maximum: 200 }
    validates :description, uniqueness: true

    belongs_to :user
end
