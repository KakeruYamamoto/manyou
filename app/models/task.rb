class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  enum priority: { 低: 0, 中: 1, 高: 2 }

  belongs_to :user

  scope :title_scope, ->(name) { where('title LIKE ?', "%#{name}%") }
  scope :status_scope, ->(state) { where('status LIKE ?', "%#{state}%") }
  scope :user_scope, ->(user) { where(user_id: user ) }
end
