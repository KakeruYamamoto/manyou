class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  scope :title_scope, ->(name) { where('title LIKE ?', "%#{name}%") }
  scope :status_scope, ->(state) { where('status LIKE ?', "%#{state}%") }
end
