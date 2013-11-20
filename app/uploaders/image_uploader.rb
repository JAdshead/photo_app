class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include CarrierWave::MimeTypes
  process :set_content_type

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [200, 200]
  end

  version :photo_resize do
    process :resize_to_fit => [800, 800]
  end

  version :home_grid do 
    process :resize_to_fill => [480, 300]
  end

  version :profile_grid do 
    process :resize_to_fill => [516, 240]
  end
end
