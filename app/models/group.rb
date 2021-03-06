class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  # has_many :messages
  validates_uniqueness_of :name, presence: true
end

