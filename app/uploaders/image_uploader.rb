class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  def store_dir
   'public/my/upload/directory'
  end

  version :thumb do
    process :resize_to_fit => [400, 200]
  end

  def extension_white_list
    %W[jpg jpeg gif png]
  end

  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end
end

