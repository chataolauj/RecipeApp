class Recipe < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    dragonfly_accessor :image
end
