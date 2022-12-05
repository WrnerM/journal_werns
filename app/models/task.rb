class Task < ApplicationRecord
    validates :name, presence: true,
                     length: { minimum: 5 }
    validates :description, presence: true,
                     length: { minimum: 5 }
    validates :deadline, presence: true


    belongs_to :category

    def self.tasks_today
        Task.where(deadline: Time.now.beginning_of_day..Time.now.end_of_day).order(deadline: :desc)
    end
end
