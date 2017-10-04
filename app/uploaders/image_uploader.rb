class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [400, 200]
  end

  def extension_white_list
    %W[jpg jpeg gif png]
  end

  def filename
    # "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
    "sentakun.jpg" if original_filename.present?
  end
end
