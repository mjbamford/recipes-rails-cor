class Page < ApplicationRecord
  belongs_to :recipe
  belongs_to :cookbook
end
