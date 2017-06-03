class Group < ApplicationRecord
  has_many :users_groups
  has many :users, through: :groups_users
  has_many :messages

  validates :name, presence: true
end
