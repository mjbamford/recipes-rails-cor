class Recipe < ApplicationRecord
    belongs_to :author
    has_and_belongs_to_many :ingredients
    has_many :pages
    has_many :cookbooks, through: :pages
    has_many :comments, as: :commentable
end
