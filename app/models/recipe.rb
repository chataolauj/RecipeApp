class Recipe < ApplicationRecord
    has_many :comments
    dragonfly_accessor :image
end
