class Task < ApplicationRecord
    validates :name, presence: true,
                     length: { minimum: 5 }
    validates :description, presence: true,
                     length: { minimum: 5 }

    belongs_to :category
end
