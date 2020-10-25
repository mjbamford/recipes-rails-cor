class Author < ApplicationRecord
    has_many :recipes
    has_many :mentees, class_name: 'Author', foreign_key: 'mentor_id'
    belongs_to :mentor, class_name: 'Author', optional: true
    has_many :comments, as: :commentable

    def display_name
        [ first_name, last_name ].join(' ')
    end
end