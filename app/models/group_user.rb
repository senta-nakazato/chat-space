class GroupUser < ApplicationRecord
  belongs_to :group
  belobgs_to :user
end
