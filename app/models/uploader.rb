class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    # 'images'
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [1000, 1000]

  version :thumb do
    process resize_to_fill: [300, 300]
  end
end
