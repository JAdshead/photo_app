class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes

  process :set_content_type
  storage :fog
  
  version :avatar_resize do
    process :resize_to_fill => [80, 80]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
