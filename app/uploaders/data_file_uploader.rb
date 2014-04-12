# encoding: utf-8

class DataFileUploader < CarrierWave::Uploader::Base
  include PurchaseFileImporter

  storage :file

  process :import_purchases

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(txt tab tsv)
  end
end
