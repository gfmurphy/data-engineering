module PurchaseFileImporter
  extend ActiveSupport::Concern

  module ClassMethods
    def import_purchases
      process :import_purchases
    end
  end

  def import_purchases
    cache_stored_filed! if !cached?

    PurchaseImporter.new(model).import do |importer|
      DataFileParser.new(current_path).each do |row|
        importer << row
      end
    end
  end
end
