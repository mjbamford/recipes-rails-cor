class Cookbook < ApplicationRecord
    has_many :pages
    has_many :recipes, through: :pages
    has_many :comments, as: :commentable
end
