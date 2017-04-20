class Recipe < ApplicationRecord
    has_many :comments, dependent: :destroy
    dragonfly_accessor :image
end
