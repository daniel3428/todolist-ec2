class Todo < ApplicationRecord
    belongs_to :user

    has_many :sec_todos
end
