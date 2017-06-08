class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :text_or_image, presence: true

  private
    def text_or_image
      text || image
    end
end

