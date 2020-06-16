class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  has_many :users, dependent: :destroy
  has_many :tools, dependent: :destroy
end
