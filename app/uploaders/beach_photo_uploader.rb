# encoding: utf-8

class BeachPhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end
end
