require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a text" do
      message = build(:message, image: "")
      message.valid?
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, text: "")
      message.valid?
      expect(message).to be_valid
    end

    it "is valid with a image and a text" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    it "is invalid without a image and a text" do
      message = build(:message, text: nil, image: nil)
      message.valid?
      expect(message.errors[:text_or_image]).to include("を入力してください。")
    end
  end
end

