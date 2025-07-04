# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  deadline   :datetime         not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
class Task < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { minimum: 1, maximum: 30 }

    validates :content, presence: true
    validates :content, length: { minimum: 1, maximum: 200 }

    validates :deadline, presence: true

    belongs_to :user
    belongs_to :board
end
