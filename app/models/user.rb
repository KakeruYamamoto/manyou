class User < ApplicationRecord
  before_validation :ensure_has_name
  before_update :update_admin_count
  before_destroy :destroy_admin_count

  validates :name, length: { maximum: 30 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :tasks, dependent: :destroy

  private

  def ensure_has_name
    self.name = 'NoNameUser' if name.blank?
  end

  def destroy_admin_count
    throw(:abort) if User.where(admin: true).length <= 1 && self.admin?
  end

  def update_admin_count
    throw(:abort) if User.where(admin: true).length <= 1
  end

end
