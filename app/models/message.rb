class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :text_or_image, presence: true
  mount_uploader :image, ImageUploader
  # attr_accessaor :image

  private
    def text_or_image
      text.presence || image.presence
    end
end

