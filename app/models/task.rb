class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  # validates :labels, exclusion: { in: [nil] }
  enum priority: { 低: 0, 中: 1, 高: 2 }

  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  scope :title_scope, ->(name) { where('title LIKE ?', "%#{name}%") }
  scope :status_scope, ->(state) { where('status LIKE ?', "%#{state}%") }
  # scope :label_scope, ->(label) { where(id: labelings.where(label_id: label)) if label.present? }
  scope :label_scope, ->(label) { where(id: Labeling.where(label_id: label).pluck(:task_id)) if label.present?  }
  scope :user_scope, ->(user) { where(user_id: user ) }
end
