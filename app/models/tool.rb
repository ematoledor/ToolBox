class Tool < ApplicationRecord
    belongs_to :user
    has_many :rentals, dependent: :destroy
    has_many_attached :photos
end
