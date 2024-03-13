class Like < ApplicationRecord
  belongs_to :pin, touch: true
  belongs_to :user
end
